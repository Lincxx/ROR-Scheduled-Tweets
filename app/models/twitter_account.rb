class TwitterAccount < ApplicationRecord
    has_many :tweets
    belongs_to :user

    # this will stop us from creating a dup record
    validates :username, uniqueness: true
end
