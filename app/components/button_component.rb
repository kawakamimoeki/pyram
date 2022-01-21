# frozen_string_literal: true

class ButtonComponent < ViewComponent::Base
  def initialize(text: nil, url: nil, type: :primary, method: :get)
    @text = text
    @url = url
    @type = type
    @method = method
  end

  def colors
    {
      primary: 'bg-sky-500',
      secondary: 'bg-gray-500',
      danger: 'bg-red-500'
    }
  end

  def color
    colors[@type.to_sym]
  end
end
