module UserAvatarHelper
  # Returns thumbnails for users avatars.
  def avatar_thumbnail(user)
    link_to user.avatar_url, target: '_blank', class: 'avatar' do
      image_tag(user.avatar_url)
    end
  end

  # Gets the first letter from the first name or username and capitalizes it.
  def get_the_first_letter(user)
    if user.current_name.present?
      user.current_name[0, 1].capitalize
    end
  end

  # Returns avatar placeholder icon color.
  # Disable MthodLength cop since because the way it is, is more readable.
  # rubocop:disable MethodLength
  def icon_color(user)
    allowed_colors = {
      amber:          '#FFC107',
      blue:           '#0cc',
      darkblue:       '#0D47A1',
      darkcyan:       '#00ACC1',
      darkgrey:       '#a9a9a9',
      darkgreen:      '#2E7D32',
      darkkhaki:      '#C0CA33',
      darkmagenta:    '#8b008b',
      darkolivegreen: '#556b2f',
      darkorange:     '#ff8c00',
      darkorchid:     '#8E24AA',
      darkred:        '#8b0000',
      darksalmon:     '#e9967a',
      black:          '#000000',
      darkviolet:     '#9400d3',
      fuchsia:        '#ff00ff',
      gold:           '#ffd700',
      green:          '#4CAF50',
      lightgreen:     '#8BC34A',
      indigo:         '#3F51B5',
      magenta:        '#D500F9',
      mycyan:         '#00BCD4',
      mylime:         '#00E676',
      myaqua:         '#039BE5',
      navy:           '#1A237E',
      olive:          '#808000',
      orange:         '#E65100',
      pink:           '#E91E63',
      purple:         '#9C27B0',
      red:            '#F44336',
      violet:         '#EE82EE',
      teal:           '#009688'
    }

    bg_key = user.id % 33
    style = "color: #{allowed_colors.values[bg_key]};"
    style.to_s
  end
  # rubocop:enable MethodLength

  # Returns a tiny circle with the user avatar inside or a tiny circle
  # with the first letter of user's username.
  def design_avatar(user)
    if user.avatar.present?
      content_tag(:span, avatar_thumbnail(user), class: 'user-avatar')
    else
      content_tag(:span,
                  content_tag(:i,
                              nil,
                              style: icon_color(user),
                              class: 'fa fa-circle fa-stack-2x') +
                  content_tag(:span,
                              get_the_first_letter(user),
                              class: 'fa-stack-1x blank-text'),
                  class: 'fa-stack fa-lg user-avatar-placeholder')
    end
  end
end
