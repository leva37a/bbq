module ApplicationHelper

  def user_avatar(user)
    if user.avatar?
      user.avatar.url
    else
      asset_path("user.png")
    end
  end

  def event_photo(event)
  photos = event.photos.persisted

    if photos.any?
      photos.sample.photo.url
    else
      asset_path('event.jpg')
    end
  end

  def event_thumb(event)
    photos = event.photos.persisted

    if photos.any?
      photos.sample.photo.thumb.url
    else
      asset_path('event_thumb.jpg')
    end
  end

  def user_avatar_thumb(user)
    if user.avatar.present?
      user.avatar.thumb.url
    else
      asset_path('user.png')
    end
  end

  def type_icon(icon_class)
    content_tag 'span', '', class: "bi bi-#{icon_class}"
  end
end
