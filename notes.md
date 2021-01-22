Grouper models

A virtual community to help connect professionals with similar skills, interests or passions.

#User
    has_many :topics
    has_many :groups
    has_many :topic_groups, through: :topics, source: :group
    email
    password_digest
    profession
    years_of_experience
    skills

#Group
    has_many :topics
    has_many :users, through :topics
    title
    description
    rules
    user_count
    creation_date


#Topic

    belongs_to :user
    belongs_to :group
    title


#############Do later##############

#Events