class Recruiter < ActiveRecord::Base
    has_one :profile, as: :user
    has_many :skills, through: :profile

    has_many :events
    has_many :add_events, through: :events

    def recruiters
        self.events.collect{|event| event.job_seekers}
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

    def add_event(event)
    end

    def edit_event(event_to_change, updated_event)
        update_this = self.events.find_by(description: event_to_change)
        update_this.event_date = updated_event[:event_date]
        update_this.location = updated_event[:location]
        update_this.description = updated_event[:description]
    end

    def edit_location(location)
        self.update(location: location)
    end

    def edit_company_name(company_name)
        self.update(company_name: company_name)
    end
    
    def show_match
        # match a list of job seekers based on skill, not event
    end

end

# below works:
# Recruiter.first.profile
# Recruiter.first.skills
# Recruiter.first.events
# Recruiter.first.add_events

