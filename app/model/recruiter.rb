class Recruiter < ActiveRecord::Base
    has_one :profile, as: :user
    has_many :skills, through: :profile

    has_many :events
    has_many :add_events, through: :events
end

# below works:
# Recruiter.first.profile
# Recruiter.first.skills
# Recruiter.first.events
# Recruiter.first.add_events