class Group < ApplicationRecord
    belongs_to :user
    has_many :topics
    has_many :users, through: :topics

    has_many :meetings
    #has_many :users, through: :meetings

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

    def meeting_attributes=(meeting_attributes)
        meeting_attributes.values.each do |meeting_attribute|
            if meeting_attribute[:name].present?
                meeting = Meeting.find_or_create_by(meeting_attribute)
                self.meetings << meeting
            end
        end
    end
end
