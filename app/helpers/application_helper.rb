module ApplicationHelper
  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to(name, '#', class: "add_fields btn btn-info", data: {id: id, fields: fields.gsub("\n", "")})
  end

  def display_image_file(image_file_object)    #for product-image    # can be extended to other type of fiels
    if image_file_object.present? && image_file_object.image_content_type =~ /^image/
      image_tag image_file_object.image.url(:large), class: "img-responsive"
      # bootstrap class: img-responsive- shrink image when smaller screen
    end
  end

  def display_sm_image_file(image_file_object)    #for product-image
    if image_file_object.present? && image_file_object.image_content_type =~ /^image/
      image_tag image_file_object.image.url(:thumb), class: "img-responsive"
      # bootstrap class: img-responsive- shrink image when smaller screen
    end
  end

  def  display_current_price(basic_price, sold_price) #for product
    if sold_price.present? && basic_price > 0 && basic_price != sold_price
          content_tag(:h5, content_tag(:del, "Was: " + number_to_currency(basic_price, :locale => 'en-GB'))) +
          content_tag(:h4, "Now: " + number_to_currency(sold_price, :locale => 'en-GB')) + "" +
          content_tag(:p, number_to_percentage((sold_price.to_f/basic_price)*100, precision: 0) + " off", class: "discount")
    else
      content_tag(:h4, number_to_currency(basic_price, :locale => 'en-GB'))
    end
  end


  # def display_price_discount(original_price, sold_price)
  #   if sold_price.present? && original_price > 0
  #     content_tag(:h2, number_to_percentage((sold_price.to_f/original_price)*100, precision: 0), class: "discount")
  #   end
  # end
end
