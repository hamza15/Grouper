class Topic < ApplicationRecord
    belongs_to :user
    belongs_to :group
    
    validates :title, presence: true
    validates :group, uniqueness: {scope: :user_id, message: "Only one Topic per user allowed."}
end