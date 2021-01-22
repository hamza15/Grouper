class User < ApplicationRecord
    has_many :groups
    has_many :topics
    has_many :topic_groups, through: :topics, source: :group

    has_secure_password

    validates: :username, :email, presence: true

end