class Invite < ApplicationRecord
  belongs_to :book

  def url
    Rails.application.routes.url_helpers.invite_url(id: id, key: key, token: token, host: ENV["HOST"], protocol: ENV["PROTOCOL"])
  end
end
