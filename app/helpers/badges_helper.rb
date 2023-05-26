module BadgesHelper
  def badge_image_helper(badge)
    badge.image_url.capitalize == 'None' ? badge.image_url : (image_tag badge.image_url, class: 'img-thumbnail w-25')
  end
end
