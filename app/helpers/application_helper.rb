module ApplicationHelper
  
  IMAGES = ["1", "2", "3"]
 
  def randomized_background_image
    "/assets/forms/#{IMAGES.sample}.jpg"


  end
  
end