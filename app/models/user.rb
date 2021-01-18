class User < ApplicationRecord
    has_many :groups
    has_many :memberships
    has_many :user_groups, through: :memberships, source: :group

    has_secure_password
end