# == Schema Information
#
# Table name: shortened_urls
#
#  id         :integer          not null, primary key
#  long_url   :string           not null
#  short_url  :string           not null
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer          not null
#

require 'securerandom'

class ShortenedUrl < ActiveRecord::Base

  validates :long_url, :short_url, uniqueness: true
  validates :long_url, :short_url, :user_id, presence: true

  has_many :visits,
    class_name: :Visit,
    foreign_key: :short_url_id,
    primary_key: :id

  has_many :users,
    -> { distinct },
    through: :visits,
    source: :user

  def self.random_code
    short_string = SecureRandom.base64(10)
    while ShortenedUrl.exists?(short_string)
      short_string = SecureRandom.base64(10)
    end

    short_string
  end

  def self.create!(user, long_url)
    short_url = ShortenedUrl.random_code
    ShortenedUrl.new(user_id: user.id, short_url: short_url, long_url: long_url).save
  end

  def num_clicks
    visits.length
  end

  def num_uniques
    users.select(:id).length
  end

  def num_recent_uniques
    p users
    users.where("created_at > ?", 10.minutes.ago)
  end

  # def short_url=(value)
  #   # do nothing
  # end



end
