module Admin::ProductsHelper
  def display_image_file(image_file_object)    #for product
    #if upload_file_object.upload_file_name =~ /\.(gif|jpg|jpeg|tiff|png)$/
    if image_file_object.present? && image_file_object.image_content_type =~ /^image/
      image_tag image_file_object.image.url(:large), class: "img-responsive"
      # upload_file_object.upload.url, url(:thumb)- thumb image;
      # bootstrap class: img-responsive- shrink image when smaller screen
      #else
      #link_to image_file_object.image_file_name, image_file_object.image.url
    end
  end
end
