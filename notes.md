Grouper models

A virtual community to help connect professionals with similar skills, interests or passions.

#User
    has_many :memberships
    has_many :groups, through :memberships
    email
    password_digest
    profession
    years_of_experience
    skills

#Group
    has_many :memberships
    has_many :users, through :memberships
    title
    description
    rules
    user_count
    creation_date


#Membership

    belongs_to :user
    belongs_to :group
    join_date (think of something better)
    moderator (boolean)
    ##member_id


#############Do later##############

#Post

    belongs_to :user
    belongs_to :group
    text