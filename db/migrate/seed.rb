Recruiter.new(name: "John", company_name: "Microsoft", location: "New York, NY")
JobSeeker.new(name: "Suey", location: "Seattle, WA")

Profile.new(user_id: 1, user_type: "Recruiter")
Profile.new(user_id: 2, user_type: "JobSeeker")

Skill.new(profile_id: 1, name: "Ruby", level: 3)
Skill.new(profile_id: 2, name: "Ruby", level: 3)

recruiter#match
# this recruiter is looking for job seeker with Ruby skill
JobSeeker.all.select{|seeker| seeker.skill == self.skill}

recruiter#attendees
self.events.collect{|event| event.seeker}
