class Tweet < ApplicationRecord
  belongs_to :user
  belongs_to :twitter_account

  validates :body, length: {minimum: 1, maximum: 280}
  validates :publish_at, presence: true

  after_initialize do 
    #||=
    # if a is undefined or falsey, then evaluate b and set a to the result.
    #Otherwise (if a is defined and evaluates to truthy), then b is not evaluated, and no assignment takes place.
    self.publish_at ||= 24.hour.from_now
  end

  def published?
    tweet_id?
  end
end
