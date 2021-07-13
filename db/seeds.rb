

puts "Clearing old data..."
Recruiter.destroy_all
JobSeeker.destroy_all
Profile.destroy_all
Skill.destroy_all
Event.destroy_all
AddEvent.destroy_all


puts "Seeding recruiters..."
# Recruiter.create(name: "John", company_name: "Microsoft", location: "Redmond, WA")
# Recruiter.create(name: "Amanda", company_name: "Facebook", location: "Menlo Park, CA")
# Recruiter.create(name: "Hanna", company_name: "Spotify", location: "New York, NY")
# Recruiter.create(name: "Eric", company_name: "Tesla", location: "Palo Alto, CA")
# Recruiter.create(name: "Ali", company_name: "NASA", location: "Houston, TX")

# recruiters with matching locations with job seekers
Recruiter.create(name: "John", company_name: "Microsoft", location: "Seattle, WA")
Recruiter.create(name: "Amanda", company_name: "Facebook", location: "San Francisco, CA")
Recruiter.create(name: "Hanna", company_name: "Spotify", location: "New York, NY")
Recruiter.create(name: "Eric", company_name: "Tesla", location: "San Francisco, CA")
Recruiter.create(name: "Ali", company_name: "NASA", location: "Houston, TX")

puts "Seeding job seekers..."
JobSeeker.create(name: "Suey", location: "Seattle, WA")
JobSeeker.create(name: "Joyce", location: "New York, NY")
JobSeeker.create(name: "Alex", location: "Seattle, WA")
JobSeeker.create(name: "Brianna", location: "Los Angeles, CA")
JobSeeker.create(name: "Angelo", location: "Houston, TX")
JobSeeker.create(name: "SeanB", location: "San Francisco, CA")

puts "Seeding profiles..."
Profile.create(user_id: Recruiter.all[0].id, user_type: "Recruiter")
Profile.create(user_id: Recruiter.all[1].id, user_type: "Recruiter")
Profile.create(user_id: Recruiter.all[2].id, user_type: "Recruiter")
Profile.create(user_id: Recruiter.all[3].id, user_type: "Recruiter")
Profile.create(user_id: Recruiter.all[4].id, user_type: "Recruiter")
Profile.create(user_id: JobSeeker.all[0].id, user_type: "JobSeeker")
Profile.create(user_id: JobSeeker.all[1].id, user_type: "JobSeeker")
Profile.create(user_id: JobSeeker.all[2].id, user_type: "JobSeeker")
Profile.create(user_id: JobSeeker.all[3].id, user_type: "JobSeeker")
Profile.create(user_id: JobSeeker.all[4].id, user_type: "JobSeeker")
Profile.create(user_id: JobSeeker.all[5].id, user_type: "JobSeeker")

puts "Seeding skills..."
Skill.create(profile_id: Profile.all[0].id, name: "Java", level: 3)
Skill.create(profile_id: Profile.all[0].id, name: "Python", level: 3)
Skill.create(profile_id: Profile.all[0].id, name: "C++", level: 3)
Skill.create(profile_id: Profile.all[1].id, name: "Ruby", level: 3)
Skill.create(profile_id: Profile.all[1].id, name: "Java", level: 3)
Skill.create(profile_id: Profile.all[1].id, name: "C++", level: 3)
Skill.create(profile_id: Profile.all[1].id, name: "JavaScript", level: 3)
Skill.create(profile_id: Profile.all[2].id, name: "Go", level: 3)
Skill.create(profile_id: Profile.all[2].id, name: "Java", level: 3)
Skill.create(profile_id: Profile.all[2].id, name: "C++", level: 3)
Skill.create(profile_id: Profile.all[3].id, name: "Python", level: 3)
Skill.create(profile_id: Profile.all[3].id, name: "Java", level: 3)
Skill.create(profile_id: Profile.all[3].id, name: "TypeScript", level: 3)
Skill.create(profile_id: Profile.all[4].id, name: "Python", level: 3)
Skill.create(profile_id: Profile.all[4].id, name: "Java", level: 3)
Skill.create(profile_id: Profile.all[4].id, name: "C#", level: 3)
Skill.create(profile_id: Profile.all[4].id, name: "JavaScript", level: 3)

Skill.create(profile_id: Profile.all[5].id, name: "Ruby", level: 3)
Skill.create(profile_id: Profile.all[5].id, name: "JavaScript", level: 3)
Skill.create(profile_id: Profile.all[5].id, name: "Python", level: 3)
Skill.create(profile_id: Profile.all[6].id, name: "Java", level: 3)
Skill.create(profile_id: Profile.all[6].id, name: "JavaScript", level: 3)
Skill.create(profile_id: Profile.all[6].id, name: "C#", level: 3)
Skill.create(profile_id: Profile.all[7].id, name: "C++", level: 3)
Skill.create(profile_id: Profile.all[7].id, name: "JavaScript", level: 3)
Skill.create(profile_id: Profile.all[7].id, name: "Go", level: 3)
Skill.create(profile_id: Profile.all[8].id, name: "Java", level: 3)
Skill.create(profile_id: Profile.all[8].id, name: "Python", level: 3)
Skill.create(profile_id: Profile.all[8].id, name: "C++", level: 3)
Skill.create(profile_id: Profile.all[9].id, name: "JavaScript", level: 3)
Skill.create(profile_id: Profile.all[9].id, name: "TypeScript", level: 3)
Skill.create(profile_id: Profile.all[9].id, name: "Go", level: 3)
Skill.create(profile_id: Profile.all[10].id, name: "C", level: 3)
Skill.create(profile_id: Profile.all[10].id, name: "Java", level: 3)
Skill.create(profile_id: Profile.all[10].id, name: "Python", level: 3)

puts "Seeding events..."
# Event.create(recruiter_id: Recruiter.all[0].id, event_date: DateTime.parse("07/20/2021 18:00"), location: "Seattle, WA", description: "An evening meetup event with beer")
# Event.create(recruiter_id: Recruiter.all[0].id, event_date: DateTime.parse("07/30/2021 11:00"), location: "Seattle, WA", description: "Let's go grab lunch and talk about code!")
# Event.create(recruiter_id: Recruiter.all[1].id, event_date: DateTime.parse("07/22/2021 17:00"), location: "San Francisco, CA", description: "Coding workshop featuring one of our brilliant Tech Leads")
# Event.create(recruiter_id: Recruiter.all[2].id, event_date: DateTime.parse("07/25/2021 18:00"), location: "New York, NY", description: "A relaxing career social event")
# Event.create(recruiter_id: Recruiter.all[3].id, event_date: DateTime.parse("08/3/2021 12:00"), location: "San Francisco, CA", description: "Lunch and code")
# Event.create(recruiter_id: Recruiter.all[4].id, event_date: DateTime.parse("07/28/2021 17:00"), location: "Houston, TX", description: "Dinner's on us!")

Event.create(recruiter_id: Recruiter.all[0].id, event_date: DateTime.strptime("07/20/2021 18:00", "%m/%d/%Y %H:%M"), location: "Seattle, WA", description: "An evening meetup event with beer")
Event.create(recruiter_id: Recruiter.all[0].id, event_date: DateTime.strptime("07/30/2021 11:00", "%m/%d/%Y %H:%M"), location: "Seattle, WA", description: "Let's go grab lunch and talk about code!")
Event.create(recruiter_id: Recruiter.all[1].id, event_date: DateTime.strptime("07/22/2021 17:00", "%m/%d/%Y %H:%M"), location: "San Francisco, CA", description: "Coding workshop featuring one of our brilliant Tech Leads")
Event.create(recruiter_id: Recruiter.all[2].id, event_date: DateTime.strptime("07/25/2021 18:00", "%m/%d/%Y %H:%M"), location: "New York, NY", description: "A relaxing career social event")
Event.create(recruiter_id: Recruiter.all[3].id, event_date: DateTime.strptime("08/3/2021 12:00", "%m/%d/%Y %H:%M"), location: "San Francisco, CA", description: "Lunch and code")
Event.create(recruiter_id: Recruiter.all[4].id, event_date: DateTime.strptime("07/28/2021 17:00", "%m/%d/%Y %H:%M"), location: "Houston, TX", description: "Dinner's on us!")


puts "Seeding add_events..."
AddEvent.create(event_id: Event.all[0].id, job_seeker_id: JobSeeker.all[0].id) #Seattle
AddEvent.create(event_id: Event.all[1].id, job_seeker_id: JobSeeker.all[0].id) #Seattle
AddEvent.create(event_id: Event.all[0].id, job_seeker_id: JobSeeker.all[2].id) #Seattle
AddEvent.create(event_id: Event.all[2].id, job_seeker_id: JobSeeker.all[5].id) #SF
AddEvent.create(event_id: Event.all[3].id, job_seeker_id: JobSeeker.all[1].id) #NY
AddEvent.create(event_id: Event.all[4].id, job_seeker_id: JobSeeker.all[5].id) #SF
AddEvent.create(event_id: Event.all[5].id, job_seeker_id: JobSeeker.all[4].id) #HT

puts "🌱🌱🌱🌱 Done! 🌱🌱🌱🌱"

# recruiter#match
# # this recruiter is looking for job seeker with Ruby skill
# JobSeeker.all.select{|seeker| seeker.skill == self.skill}

# recruiter#attendees
# self.events.collect{|event| event.seeker}
