module UsersHelper
  # Returns the Gravatar for the given user.
  def gravatar_for(user, options = { size: 80 })
    size = options[:size]
    gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: 'gravatar')
  end

  def magic_icon(user, size: 80)
    icon_no = (user.id % 8) + 1
    image_tag("magic/magic#{icon_no}.png", alt: user.name, size: "#{size}x#{size}", class: 'gravatar')
  end
end
