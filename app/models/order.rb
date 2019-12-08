class Order < ActiveRecord::Base
	PAYMENT_TYPES = [ "Cash on Delivery (COD)", "Bank-in" ]

	as_enum :shipment_status, %i{Pending Shipped Canceled}
	as_enum :order_status, %i{Pending OK Canceled}
	as_enum :payment_status, %i{Pending Paid}

	belongs_to :users
	validates :name, :address, :email, :states, presence: true
	validates :pay_type, inclusion: PAYMENT_TYPES
	validates :contact_number, :numericality => {:only_integer => true}

    extend FriendlyId
    friendly_id :number, slug_column: :number, use: [:slugged,:finders]
    include NumberGenerator.new(prefix: 'R')


	
	def total_without_delivery
		total_price - delivery_cost
	end

	def net_profit
		line_items.to_a.sum {|item| item.variant.price - item.variant.cost_price}
	end

	def add_line_items_from_cart(cart)
		cart.line_items.each do |item|
			item.cart_id = nil
			line_items << item
			item.final_price = item.variant.price
		end
	end


	def update_stock
		line_items.each do |line_item|
			removed_quantity = line_item.quantity
			final_quantity = line_item.variant.count_on_hand - removed_quantity
			line_item.variant.update_attribute(:count_on_hand, final_quantity)
			LineItem.where(variant_id: line_item.variant.id, :order_id => nil).each do | update_li|
				if update_li.quantity > final_quantity
				update_li.update_attribute(:quantity, final_quantity)
				LineItem.where(quantity: 0).delete_all
				end
			end
		end
	end

	def update_canceled_quantity
		if self.order_status_cd == 2
			self.line_items.each do |line|
				current_q = Variant.find_by(id: line.variant.id).count_on_hand
				if Product.find_by(id: line.variant.product_id).hidden == false
					current_q += line.quantity
				else
					current_q
				end
				Variant.find_by(id: line.variant.id).update_attributes(count_on_hand: current_q)
			end
		end
	end

	def update_shipping_and_total
		if self.pay_type == "Bank-in"
			if ['Perlis', 'Penang', 'Perak', 'Kedah', 'Terengganu', 'Johor', 'Melaka', 'Negeri Sembilan', 'Pahang', 'Kelantan'].include?(self.states)
				self.update_attribute(:delivery_cost, '10')
			elsif ['Kuala Lumpur', 'Selangor'].include?(self.states)
				self.update_attribute(:delivery_cost, '5')	
			elsif ['Sabah', 'Sarawak', 'Labuan'].include?(self.states)
				self.update_attribute(:delivery_cost, '12')			
			end
			grand_total = total_price_new + delivery_cost
			self.update_attribute(:total_price, grand_total)
		elsif self.pay_type == "Cash on Delivery (COD)"
			self.update_attribute(:delivery_cost, '0')
			grand_total = total_price_new + delivery_cost
			self.update_attribute(:total_price, grand_total)
		end
	end
end
