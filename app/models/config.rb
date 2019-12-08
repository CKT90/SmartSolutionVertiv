class Config < ActiveRecord::Base
	belongs_to :user, class_name: "Config", foreign_key: :user_id
	validates :project, :rack_q, presence: true
	validates :rack_q, :numericality => {:only_integer => true, :less_than_or_equal_to => 6, :greater_than => 0}

    extend FriendlyId
    friendly_id :number, slug_column: :number, use: [:slugged,:finders]
    include NumberGenerator.new(prefix: 'C')

    def proposal_link
    	if self.rack_q == 1
    		"rack1"
    	elsif self.rack_q == 2
    		"rack2"
    	elsif self.rack_q == 3
    		"rack3"
    	elsif self.rack_q == 4
    		"rack4"
    	elsif self.rack_q == 5
    		"rack5"
    	elsif self.rack_q == 6
    		"rack6"	
    	end
    end

    def self.to_csv(options = {})
        CSV.generate(options) do |csv|
            csv << column_names
            all.each do |config|
                csv << config.attributes.values_at(*column_names)
            end
        end
    end
end
