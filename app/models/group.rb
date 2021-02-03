class Group < ApplicationRecord
    belongs_to :user
    has_many :topics
    has_many :users, through: :topics

    has_many :meetings

    accepts_nested_attributes_for :meetings

    validates :title, :description, :rules, presence: true

    scope :my_groups, -> (user_id) {
        where(
            "id IN ( SELECT user_id 
            FROM groups
            WHERE user_id = ?
          )",
   user_id 
        )
    }

end
