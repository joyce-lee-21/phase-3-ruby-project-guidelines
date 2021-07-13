class Recruiter < ActiveRecord::Base
    has_one :profile, as: :user
    has_many :skills, through: :profile

    has_many :events
    has_many :add_events, through: :events

    def add_skill(name, level)
        Skill.create(profile_id: self.profile.id, name: name, level: level)
    end
end

# below works:
# Recruiter.first.profile
# Recruiter.first.skills
# Recruiter.first.events
# Recruiter.first.add_events

