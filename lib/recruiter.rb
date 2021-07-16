class Recruiter < ActiveRecord::Base
    has_one :profile, as: :user
    has_many :skills, through: :profile

    has_many :events
    has_many :add_events, through: :events

    def job_seekers
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

    def add_event(name, event_date, location, description, image)
        Event.create(recruiter_id: self.id, name: name, event_date: DateTime.strptime(event_date, "%m/%d/%Y %H:%M"), location: location, description: description, image: image)
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
    
    def all_matching_job_seekers
        recruiter_skill_names = self.view_skills #=> array of skill_name

        all_job_seeker_skills_flattened = JobSeeker.all.map{|job_seeker| job_seeker.skills}.flatten #=> return an arr of skill instance
        
        matching = recruiter_skill_names.map{|recruiter_skill_name| 
            all_job_seeker_skills_flattened.select{|job_seeker_skill| job_seeker_skill.name == recruiter_skill_name }
        }.flatten #=> return all the matching skill instance with profile_id

        mactching_profile_id_arr = matching.map {|match| match.profile_id}

        #sort array by count-of-occurrences : https://stackoverflow.com/questions/10842210/sort-and-display-items-by-count-of-occurrences/10842419
        sorted_mactching_profile_id_arr = mactching_profile_id_arr.group_by{|x| x}.sort_by{|k, v| -v.size}.map(&:first)
        sorted_matching_recruitor_arr = sorted_mactching_profile_id_arr.map{|matching_profile_id| 
            JobSeeker.all.select{|job_seeker| job_seeker.profile.id == matching_profile_id}}.flatten #=>return the array of matching recruiter instance
    end

    def all_matching_job_seeker_names_and_emails
        self.all_matching_job_seekers.map{|matching_job_seeker| 
            "#{matching_job_seeker.name}, #{matching_job_seeker.email}"
        }
    end

    def all_matching_job_seeker_names
        self.all_matching_job_seekers.map{|matching_job_seeker| matching_job_seeker.name}
    end

    def create_profile
        Profile.create(user_id: self.id, user_type: "Recruiter")
    end

end

# below works:
# Recruiter.first.profile
# Recruiter.first.skills
# Recruiter.first.events
# Recruiter.first.add_events

