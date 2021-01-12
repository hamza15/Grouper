Grouper models

A virtual community to help connect professionals with similar skills, interests or passions.

#User
    has_many :memberships
    has_many :groups, through :memberships
    email
    password
    profession
    years_of_experience
    skills

#Group
    has_many :memberships
    has_many :users, through :memberships
    name
    user_count
    creation_date
    description


#Membership

    belongs_to :user
    belongs_to :group
    join_date
    member_id

#Post

    belongs_to :user
    belongs_to :group
    text