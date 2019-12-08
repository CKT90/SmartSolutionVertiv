module ApplicationHelper
# Returns the full title on a per-page basis. # Documentation comment

	def full_title(page_title = '') # Method def, optional arg
			base_title = "Smartrow+ VERTIV" # Variable assignment
		if page_title.empty? # Boolean test
			base_title # Implicit return
		else
			"#{page_title} | #{base_title}" # String interpolation
		end
	end

	def hidden_div_if(condition, attributes = {}, &block)
 		if condition
  			attributes["style"] = "display: none"
 		end
 			content_tag("div", attributes, &block)
 		end


 		

def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, :child_index => id) do |builder|
      render(association.to_s.singularize + "_fields", :f => builder)
    end
    
    link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
  end


end