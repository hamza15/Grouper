class Meeting < ApplicationRecord

    belongs_to :group

    validates :name, :start_time, :group_id, presence: true

end