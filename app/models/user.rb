class User < ApplicationRecord
    has_many :groups
    has_many :topics
    has_many :topic_groups, through: :topics, source: :group

    # has_many :meetings
    # has_many :groups, through: :meetings

    has_secure_password

    validates :username, :email, :password, presence: true

    def self.from_omniauth(auth)
        where(email: auth.info.email).first_or_initialize do |user|
          user.username = auth.info.first_name
          user.email = auth.info.email
          user.password = SecureRandom.hex
        end
    end

end