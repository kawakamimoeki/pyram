module ApplicationHelper
  TYPE_COLORS = {
    'required' => '#ec4899',
    'affluent' => '#0ea5e9',
    'all' => '#4b5563'
  }

  def type_color(slug)
    TYPE_COLORS[slug] || TYPE_COLORS['all']
  end

  def greeting
    if Time.now.hour < 12 && Time.now.hour > 5
      "おはようございます🥐"
    elsif Time.now.hour >= 12 && Time.now.hour < 18
      "こんにちは🍰"
    else
      "こんばんは🥂"
    end
  end
end
