class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true

  has_many(
    :submitted_urls,
    :class_name => "ShortenedUrl",
    :foreign_key => :submitter_id,
    :primary_key => :id
  )

  has_many(
    :visits,
    :class_name => "Visit",
    :foreign_key => :visitor_id,
    :primary_key => :id
  )

  has_many :visited_urls, :through => :visits, :source => :shortened_url

  has_many(
    :distinct_visited_urls,
    Proc.new { distinct },
    :through => :visits,
    :source => :shortened_url
  )
end