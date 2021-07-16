class Application
    def call(env)
      resp = Rack::Response.new
      req = Rack::Request.new(env)

    #   if path matches /events/ 
        if req.path.match(/events/) && req.get?
        # get all events objects with the appropriate attr labels
        # => next 3 lines have access to relationships
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
 


        elsif req.path.match(/events/) && req.post?
            # req.name
            # puts req.body
            posted_content = JSON.parse(req.body.read)
            puts posted_content
            puts Recruiter.all.find_by(id: posted_content["recruiter_id"])
            new_event = Event.create(
                                    recruiter_id: posted_content["recruiter_id"],
                                    name: posted_content["name"],
                                    event_date: DateTime.strptime(posted_content["event_date"], "%m/%d/%Y %H:%M"), 
                                    location: posted_content["location"], 
                                    description: posted_content["description"])
            # Recruiter.all.find_by(id: posted_content["recruiter_id"]).add_event(new_event.id)


            return [200, { 'Content-Type' => 'application/json' }, [ {:new_event => new_event}.to_json ]]  


        elsif req.path.match(/events/) && req.delete?
            del_content = JSON.parse(req.body.read)
            # deleted_event = Event.all.find{|event| event.id == del_content["event_id"]}.destroy
            # puts del_content

            # parent_delete_event = if del_content["user_type"] == "recruiter" 
            deleted_event = Recruiter.all.select{|recruiter| recruiter.delete_db_events(del_content["event_id"]).destroy}
            # else JobSeeker.all.select{|recruiter| recruiter.events.find_by(id: del_content["event_id"]).destroy
            # end

            return [200, { 'Content-Type' => 'application/json' }, [ {:del_event => deleted_event}.to_json ]]  


        elsif req.path.match(/events/) && req.patch?
            patch_content = JSON.parse(req.body.read)
            puts patch_content["id"]
            patch_event = Event.all.find{|event| event.id == patch_content["id"]}
            # puts patch_skill
            patch_event.update(:name => patch_content["name"], :event_date => patch_content["event_date"], :location => patch_content["location"], :description => patch_content["description"])

            return [200, { 'Content-Type' => 'application/json' }, [ {:patch_event => patch_event}.to_json ]] 

            
        elsif req.path.match(/jobseekers/) && req.get?
            jobseekers = JobSeeker.all.map do |job_seeker|
                {id: job_seeker.id, 
                 name: job_seeker.name, 
                 location: job_seeker.location, 
                 username: job_seeker.username, 
                 password: job_seeker.password, 
                 email: job_seeker.email,
                 image: job_seeker.image,
                 profile_id: job_seeker.profile.id,
                 skills: job_seeker.skills,
                 view_skills: job_seeker.view_skills,
                 events: job_seeker.events,
                 view_events: job_seeker.view_events,
                 recruiters: job_seeker.recruiters,
                 all_matching_recruiters: job_seeker.all_matching_recruiters,
                 all_matching_events: job_seeker.all_matching_events_for_front_end
                }
            end

            return [200, { 'Content-Type' => 'application/json' }, [ jobseekers.to_json ]]  


        elsif req.path.match(/jobseekers/) && req.post?

            posted_content = JSON.parse(req.body.read)
            puts posted_content 
            new_job_seeker = JobSeeker.create(
                                    name: posted_content["enterSignUpName"],
                                    username: posted_content["enterSignUpUsername"],
                                    location: posted_content["enterSignUpLocation"], 
                                    password: posted_content["enterSignUpPD"],
                                    email: posted_content["enterSignUpEmail"],
                                    image: posted_content["enterSignUpImage"]
                                )
            new_job_seeker.create_profile
            
            new_job_seeker_return =                 
                {id: new_job_seeker.id, 
                name: new_job_seeker.name, 
                location: new_job_seeker.location, 
                username: new_job_seeker.username, 
                password: new_job_seeker.password, 
                email: new_job_seeker.email,
                image: new_job_seeker.image,
                profile_id: new_job_seeker.profile.id,
                skills: new_job_seeker.skills,
                view_skills: new_job_seeker.view_skills,
                events: new_job_seeker.events,
                view_events: new_job_seeker.view_events,
                recruiters: new_job_seeker.recruiters,
                all_matching_recruiters: new_job_seeker.all_matching_recruiters,
                all_matching_events: new_job_seeker.all_matching_events_for_front_end
               }

            return [200, { 'Content-Type' => 'application/json' }, [ new_job_seeker_return.to_json ]]  


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
                 profile_id: recruiter.profile.id,
                 skills: recruiter.skills,
                 view_skills: recruiter.view_skills,
                 events: recruiter.events,
                 view_events: recruiter.view_events,
                 job_seekers: recruiter.job_seekers,
                 all_matching_job_seekers: recruiter.all_matching_job_seekers
                }
            end

            return [200, { 'Content-Type' => 'application/json' }, [ recruiters.to_json ]] 


        elsif req.path.match(/recruiters/) && req.post?

            posted_content = JSON.parse(req.body.read)
            puts posted_content
            new_recruiter = Recruiter.create(
                                    name: posted_content["enterSignUpName"], 
                                    company_name: posted_content["enterSignUpCompanyName"],
                                    username: posted_content["enterSignUpUsername"], 
                                    location: posted_content["enterSignUpLocation"], 
                                    password: posted_content["enterSignUpPD"],
                                    email: posted_content["enterSignUpEmail"],
                                    logo: posted_content["enterSignUpLogo"]
                                )
            new_recruiter.create_profile


            new_recruiter_return =                 
                {   id: new_recruiter.id, 
                    name: new_recruiter.name, 
                    location: new_recruiter.location, 
                    company_name: new_recruiter.company_name,
                    username: new_recruiter.username, 
                    password: new_recruiter.password, 
                    email: new_recruiter.email,
                    logo:new_recruiter.logo,
                    profile_id: new_recruiter.profile.id,
                    skills: new_recruiter.skills,
                    view_skills: new_recruiter.view_skills,
                    events: new_recruiter.events,
                    view_events: new_recruiter.view_events,
                    job_seekers: new_recruiter.job_seekers,
                    all_matching_job_seekers: new_recruiter.all_matching_job_seekers
                }

            return [200, { 'Content-Type' => 'application/json' }, [ new_recruiter_return.to_json ]]  


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



        elsif req.path.match(/skills/) && req.post?

            posted_content = JSON.parse(req.body.read)
            # puts "USER ID: #{posted_content["user_id"]}"
            # new_skill = Skill.create(
            #                         name: posted_content["name"], 
            #                         level: posted_content["level"], 
            #                         profile_id: posted_content["profile_id"]
            #                     )
            new_skill = if posted_content["user_type"] == "recruiter" 
                Recruiter.all.find_by(id: posted_content["user_id"]).add_skill(posted_content["name"], posted_content["level"])
            else JobSeeker.all.find_by(id: posted_content["user_id"]).add_skill(posted_content["name"], posted_content["level"])
            end

            return [200, { 'Content-Type' => 'application/json' }, [ {:new_skill => new_skill}.to_json ]]  


        elsif req.path.match(/skills/) && req.delete?
            del_content = JSON.parse(req.body.read)
            puts del_content
            Skill.all.find{|skill| skill.id == del_content["id"]}.destroy

            return [200, { 'Content-Type' => 'application/json' }, [ {:del_skill => del_content}.to_json ]]  


        elsif req.path.match(/skills/) && req.patch?
            patch_content = JSON.parse(req.body.read)
            # puts patch_content["name"]
            patch_skill = Skill.all.find{|skill| skill.id == patch_content["id"]}
            # puts patch_skill
            patch_skill.update(:name => patch_content["name"], :level => patch_content["level"])

            return [200, { 'Content-Type' => 'application/json' }, [ {:patch_skill => patch_skill}.to_json ]] 
        

        else
            resp.write "Path Not Found"
        end
        resp.finish
    end
end