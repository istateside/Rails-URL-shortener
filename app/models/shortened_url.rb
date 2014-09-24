require 'securerandom'

class ShortenedUrl < ActiveRecord::Base
  validates :long_url, :short_url, presence: true, uniqueness: true
  validates :submitter_id, presence: true

  def self.create_for_user_and_long_url!(user, long_url)
    ShortenedUrl.create!(
      submitter_id: user.id,
      long_url: long_url,
      short_url: ShortenedUrl.random_code
    )
  end

  def self.random_code
    random_string = SecureRandom.urlsafe_base64
    if ShortenedUrl.exists?(:short_url => random_string)
      raise
    else
      return random_string
    end
  rescue StandardError
    retry
  end

  def num_clicks
    visits.count
  end

  def num_uniques
    distinct_visitors.count
  end

  def num_recent_uniques
    distinct_visitors.where("visits.created_at > ?", 10.minutes.ago).count
  end

  belongs_to(
    :submitter,
    :class_name => "User",
    :foreign_key => :submitter_id,
    :primary_key => :id
  )

  has_many(
    :visits,
    :class_name => "Visit",
    :foreign_key => :url_id,
    :primary_key => :id
  )

  has_many :visitors, :through => :visits, :source => :visitor

  has_many(
    :distinct_visitors,
    Proc.new { distinct },
    :through => :visits,
    :source => :visitor
  )

end

