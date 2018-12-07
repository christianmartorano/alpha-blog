module ApplicationHelper
  def gravator_for(user, options = {size: 80})
    
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    
    size = options[:size]
    
    gravatar_url = "https://api.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    
    image_tag(gravatar_url, alt: "#{user.username} gravatar", class: "img-circle")
    
  end
end
