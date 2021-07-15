class Application
    def call(env)
      resp = Rack::Response.new
      req = Rack::Request.new(env)

    #   if path matches /events/
        if req.path.match(/events/) && req.get?
        # get all events objects with the appropriate attr labels
            events = Event.all.map do |event|
                {id: event.id, 
                 name: event.name,
                 description: event.description, 
                 event_date: event.event_date, 
                 location: event.location, 
                 image: event.image,
                 recruiter: event.recruiter, 
                 job_seeker: event.job_seekers}
            end

            # return the objects into json objects; {:events} = what is going to appear in browser, can be named whatever
            return [200, { 'Content-Type' => 'application/json' }, [ events.to_json ]]   


        elsif req.path.match(/jobseekers/) && req.get?
            jobseekers = JobSeeker.all.map do |job_seeker|
                {id: job_seeker.id, 
                 name: job_seeker.name, 
                 location: job_seeker.location, 
                 username: job_seeker.username, 
                 password: job_seeker.password, 
                 email: job_seeker.email,
                 image: job_seeker.image,
                 skills: job_seeker.skills,
                 view_skills: job_seeker.view_skills,
                 events: job_seeker.events,
                 view_events: job_seeker.view_events,
                 recruiters: job_seeker.recruiters,
                 all_matching_recruiters: job_seeker.all_matching_recruiters
                }
            end

            return [200, { 'Content-Type' => 'application/json' }, [ jobseekers.to_json ]]   


        elsif req.path.match(/recruiters/) && req.get?
            recruiters = Recruiter.all.map do |recruiter|
                {id: recruiter.id, 
                 name: recruiter.name, 
                 location: recruiter.location, 
                 company_name: recruiter.company_name,
                 username: recruiter.username, 
                 password: recruiter.password, 
                 email: recruiter.email,
                 logo: recruiter.logo,
                 skills: recruiter.skills,
                 view_skills: recruiter.view_skills,
                 events: recruiter.events,
                 view_events: recruiter.view_events,
                 job_seekers: recruiter.job_seekers,
                 all_matching_job_seekers: recruiter.all_matching_job_seekers
                }
            end

            return [200, { 'Content-Type' => 'application/json' }, [ recruiters.to_json ]]  


        elsif req.path.match(/skills/) && req.get?
            skills = Skill.all.map do |skill|
                {id: skill.id, 
                 name: skill.name, 
                 profile_id: skill.profile_id,
                 level: skill.level,
                 user_type: skill.profile.user_type,
                 skill_owner: skill.profile.user
                }
            end

            return [200, { 'Content-Type' => 'application/json' }, [ skills.to_json ]]  



        elsif req.path.match(/events/) && req.post?
            # req.name
            # puts req.body
            posted_content = JSON.parse(req.body.read)
            puts posted_content
            new_event = Event.create(
                                    recruiter_id: posted_content["id"], 
                                    event_date: DateTime.strptime(posted_content["event_date"], "%m/%d/%Y %H:%M"), 
                                    location: posted_content["location"], 
                                    description: posted_content["description"])

            return [200, { 'Content-Type' => 'application/json' }, [ {:new_event => new_event}.to_json ]]  


        elsif req.path.match(/events/) && req.delete?
            del_content = JSON.parse(req.body.read)
            Event.all.find{|event| event.id == del_content["id"]}.destroy

            return [200, { 'Content-Type' => 'application/json' }, [ {:del_event => del_content}.to_json ]]  


        elsif req.path.match(/events/) && req.patch?
            patch_content = JSON.parse(req.body.read)
            puts patch_content
###########################add patch method  patch_event = 

            return [200, { 'Content-Type' => 'application/json' }, [ {:patch_event => patch_event}.to_json ]] 




        elsif req.path.match(/jobseekers/) && req.post?

            posted_content = JSON.parse(req.body.read)
            puts posted_content
            new_job_seeker = JobSeeker.create(
                                    name: posted_content["name"], 
                                    username: posted_content["username"], 
                                    location: posted_content["location"], 
                                    password: posted_content["password"],
                                    email: posted_content["email"]
                                )

            return [200, { 'Content-Type' => 'application/json' }, [ {:job_seeker => new_job_seeker}.to_json ]]  


        elsif req.path.match(/jobseekers/) && req.patch?
            patch_content = JSON.parse(req.body.read)
            puts patch_content["id"]
###########################add patch method, patch_job_seeker = 

            return [200, { 'Content-Type' => 'application/json' }, [ {:patch_job_seeker => patch_job_seeker}.to_json ]] 





        elsif req.path.match(/recruiters/) && req.post?

            posted_content = JSON.parse(req.body.read)
            puts posted_content
            new_recruiter = Recruiter.create(
                                    name: posted_content["name"], 
                                    company_name: posted_content["company_name"],
                                    username: posted_content["username"], 
                                    location: posted_content["location"], 
                                    password: posted_content["password"],
                                    email: posted_content["email"]
                                )

            return [200, { 'Content-Type' => 'application/json' }, [ {:new_recruiter => new_recruiter}.to_json ]]  



        elsif req.path.match(/recruiters/) && req.patch?
            patch_content = JSON.parse(req.body.read)
            puts patch_content["id"]
###########################add patch method, patch_recruiters = 

            return [200, { 'Content-Type' => 'application/json' }, [ {:patch_recruiters => patch_recruiters}.to_json ]] 




        elsif req.path.match(/skills/) && req.post?

            posted_content = JSON.parse(req.body.read)
            puts posted_content
            new_skill = Skill.create(
                                    name: posted_content["name"], 
                                    level: posted_content["level"], 
                                    profile_id: posted_content["id"]
                                )

            return [200, { 'Content-Type' => 'application/json' }, [ {:new_skill => new_skill}.to_json ]]  


        elsif req.path.match(/skills/) && req.delete?
            del_content = JSON.parse(req.body.read)
            Skill.all.find{|skill| skill.id == del_content["id"]}.destroy

            return [200, { 'Content-Type' => 'application/json' }, [ {:del_job_seeker => del_content}.to_json ]]  


        elsif req.path.match(/skills/) && req.patch?
            patch_content = JSON.parse(req.body.read)
            puts patch_content["id"]
###########################add patch method, patch_skill = 

            return [200, { 'Content-Type' => 'application/json' }, [ {:patch_skill => patch_skill}.to_json ]] 
        

        else

            resp.write "Path Not Found"
        end
        resp.finish
    end
end