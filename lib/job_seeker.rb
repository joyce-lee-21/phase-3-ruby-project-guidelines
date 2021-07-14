class JobSeeker < ActiveRecord::Base
    has_one :profile, as: :user
    has_many :skills, through: :profile

    has_many :add_events
    has_many :events, through: :add_events

    def recruiters
        self.events.collect{|event| event.recruiter}
    end

    def view_skills
        self.skills.collect{|skills| skills.name}
    end

    def add_skill(name, level)
        Skill.create(profile_id: self.profile.id, name: name, level: level)
    end

    def delete_skill(name)
        self.skills.find_by(name: name).destroy
    end

    def view_events
        self.events.collect{|event| event.description}
    end

    def delete_events(event)
        self.events.find_by(description: event).destroy
    end

    def edit_location(location)
        self.update(location: location)
    end

    def show_match
        # match a list of recruiters based on skill, not event
    end

    def view_matched_events
        # may use show_match method
    end
end

# below works:
# JobSeeker.first.profile
# JobSeeker.first.skills
# JobSeeker.first.events.first.recruiter
# JobSeeker.first.events
# JobSeeker.first.add_events

# match recruiter -> job seeker
# JobSeeker.first.events.first.recruiter.profile.skills


