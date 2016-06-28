module StoreHelper
  def  display_current_price(basic_price, sold_price)
    if basic_price != sold_price
        content_tag(:h5, "Was: " + number_to_currency(basic_price, :locale => 'en-GB'), class: "pull-right")+
        content_tag(:h4, "Now: " + number_to_currency(sold_price, :locale => 'en-GB'), class: "pull-right")
    elsif !sold_price.present? || (basic_price == sold_price)
       content_tag(:h4, number_to_currency(basic_price, :locale => 'en-GB'), class: "pull-right")
    end
  end
end
