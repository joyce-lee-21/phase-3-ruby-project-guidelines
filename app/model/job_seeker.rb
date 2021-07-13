class JobSeeker < ActiveRecord::Base
    has_one :profile, as: :user
    has_many :skills, through: :profile

    has_many :add_events
    has_many :events, through: :add_events
end

# below works:
# JobSeeker.first.profile
# JobSeeker.first.skills

# below DOES NOT work
# JobSeeker.first.events
# JobSeeker.first.add_events