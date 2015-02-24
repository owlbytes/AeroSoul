module ApplicationHelper

  def randomized_background_image
    images = ["/assets/images/forms/1.jpg", "/assets/images/forms/2.jpg", "/assets/images/forms/1.jpg"].shuffle
  end
end
