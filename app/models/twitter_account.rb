class TwitterAccount < ApplicationRecord
    has_many :tweets, dependent: :destroy
    belongs_to :user

    # this will stop us from creating a dup record
    validates :username, uniqueness: true

    def client
        Twitter::REST::Client.new do |config|
            config.consumer_key        =  Rails.application.credentials.dig(:twitter, :api_key)
            config.consumer_secret     = Rails.application.credentials.dig(:twitter, :api_secret)
            config.access_token        = token
            config.access_token_secret = secret
        end
    end
end
