class JobSeeker < ActiveRecord::Base
    has_one :profile, as: :user
    has_many :skills, through: :profile

    has_many :add_events
    has_many :events, through: :add_events

    def recruiters
        self.events.collect{|event| event.recruiter}
    end
end

# below works:
# JobSeeker.first.profile
# JobSeeker.first.skills
# JobSeeker.first.events.first.recruiter
# JobSeeker.first.events
# JobSeeker.first.add_events
# JobSeeker.first.events.first.recruiter.profile.skills


