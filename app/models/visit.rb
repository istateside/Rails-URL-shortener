class Visit < ActiveRecord::Base
  validates :visitor_id, :url_id, presence: true
  def self.record_visit!(user, url)
    Visit.create!(visitor_id: user.id, url_id: url.id)
  end

  belongs_to(
    :visitor,
    :class_name => "User",
    :foreign_key => :visitor_id,
    :primary_key => :id
  )

  belongs_to(
    :shortened_url,
    :class_name => "ShortenedUrl",
    :foreign_key => :url_id,
    :primary_key => :id
  )
end