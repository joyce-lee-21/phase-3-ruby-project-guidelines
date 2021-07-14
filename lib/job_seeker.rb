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



    def all_matching_recruiters
        #main logic
        #look into all the skill name of this job_seeker, collect them in to an array =>job_seeker_skill_names
        #look into the skill instances of all the recruiters are looking for, store them into an array => all_recruiter_skills_flattened
        #loop thru both arrays and select the match base on skill_name, store the result into an array => matching
        #store all the profile_id of the matching result in to an array => mactching_profile_id_arr
        #sort mactching_profile_id_arr by count-of-occurrences => sorted_mactching_profile_id_arr
        #use the sorted_mactching_profile_id_arr to find all the matching recruiter instances.

        job_seeker_skill_names = self.view_skills #=> array of skill_name

        all_recruiter_skills_flattened = Recruiter.all.map{|recruiter| recruiter.skills}.flatten #=> return an arr of skill instance
        
        matching = job_seeker_skill_names.map{|job_seeker_skill_name| 
            all_recruiter_skills_flattened.select{|recruiter_skill| recruiter_skill.name == job_seeker_skill_name }
        }.flatten #=> return all the matching skill instance with profile_id

        mactching_profile_id_arr = matching.map {|match| match.profile_id}

        #sort array by count-of-occurrences : https://stackoverflow.com/questions/10842210/sort-and-display-items-by-count-of-occurrences/10842419
        sorted_mactching_profile_id_arr = mactching_profile_id_arr.group_by{|x| x}.sort_by{|k, v| -v.size}.map(&:first)
        sorted_matching_recruitor_arr = sorted_mactching_profile_id_arr.map{|matching_profile_id| 
            Recruiter.all.select{|recruiter| recruiter.profile.id == matching_profile_id}}.flatten #=>return the array of matching recruiter instance
        
    end

    def all_matching_recruiter_company_and_name
        self.all_matching_recruiters.map{|matching_recruiter| [matching_recruiter.company_name, matching_recruiter.name]}

    end

    def all_matching_events
        self.all_matching_recruiters.map{|matching_recruiter| matching_recruiter.events}.flatten.map{|event| [ event.event_date, event.location, event.recruiter.company_name, event.recruiter.name]}
    end

    def matching_events_in_my_city #just incase we need it
        self.all_matching_events.select{|event| event.include?(self.location)}
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


