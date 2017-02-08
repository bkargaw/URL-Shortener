class Visit < ActiveRecord::Base
  validates :user_id, :short_url_id, presence: true

  belongs_to :user,
    class_name: :Visit,
    foreign_key: :user_id,
    primary_key: :id

  belongs_to :short_url,
    class_name: :Visit,
    foreign_key: :short_url_id,
    primary_key: :id

  def self.record_visit!(user, shortened_url)
    Visit.new(user_id: user.id, short_url_id: shortened_url.id)
  end

end
