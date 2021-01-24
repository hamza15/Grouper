Grouper models

A virtual community to help connect professionals with similar skills, interests or passions and schedule meetups.

#User
    has_many :topics
    has_many :groups
    has_many :topic_groups, through: :topics, source: :group
    username
    email
    password_digest

#Group
    has_many :topics
    has_many :users, through :topics
    title
    description
    rules


#Topic

    belongs_to :user
    belongs_to :group
    title


#############Do later##############

#Events
    belongs_to :group
    name
