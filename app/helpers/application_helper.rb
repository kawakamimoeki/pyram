module ApplicationHelper
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
