# frozen_string_literal: true

class AlertComponent < ViewComponent::Base
  def initialize(text: "", type: :info)
    @text = text
    @type = type
  end

  def render?
    @text.present?
  end
end
