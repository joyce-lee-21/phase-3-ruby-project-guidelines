

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
Recruiter.create(name: "John", company_name: "Microsoft", location: "Seattle, WA", username: "john", password: "123", email: "john@microsoft.com", logo:"https://www.designbust.com/download/1060/png/microsoft_logo_transparent256.png")
Recruiter.create(name: "Amanda", company_name: "Facebook", location: "San Francisco, CA", username: "amanda", password: "123", email: "amanda@facebook.com", logo:"https://cdn.iconscout.com/icon/free/png-256/facebook-logo-2019-1597680-1350125.png")
Recruiter.create(name: "Hanna", company_name: "Spotify", location: "New York, NY", username: "hanna", password: "123", email: "hanna@spotify.com", logo:"https://cdn.iconscout.com/icon/free/png-256/spotify-11-432546.png")
Recruiter.create(name: "Eric", company_name: "Tesla", location: "San Francisco, CA", username: "eric", password: "123", email: "eric@tesla.com", logo:"https://cdn.iconscout.com/icon/free/png-256/tesla-11-569489.png")
Recruiter.create(name: "Ali", company_name: "NASA", location: "Houston, TX", username: "ali", password: "123", email: "ali@nasa.com", logo:"https://cdn.iconscout.com/icon/free/png-256/nasa-282190.png")

puts "Seeding job seekers..."
JobSeeker.create(name: "Suey", location: "Seattle, WA", username: "suey", password: "123", email: "suey@gmail.com", image: "https://i.pinimg.com/originals/ec/a0/b7/eca0b73553fb07e9393c14c9a67899cb.jpg")
JobSeeker.create(name: "Joyce", location: "New York, NY", username: "joyce", password: "123", email: "joyce@microsoft.com", image: "https://i.pinimg.com/474x/e7/fb/a0/e7fba022757e23074952d1f75910ab4d.jpg")
JobSeeker.create(name: "Joe", location: "Seattle, WA", username: "alex", password: "123", email: "alex@microsoft.com", image: "https://i.pinimg.com/474x/49/e6/8c/49e68cb083f221f877cb8c54df4c2284.jpg")
JobSeeker.create(name: "Anna", location: "Los Angeles, CA", username: "brianna", password: "123", email: "brianna@microsoft.com", image: "https://up.quizlet.com/5hmda-sSqCH-256s.jpg")
JobSeeker.create(name: "Matt", location: "Houston, TX", username: "angelo", password: "123", email: "angelo@microsoft.com", image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQosI4z983JAb5qW1c9LRfCHYTnRj4V7-OiWg&usqp=CAU")
JobSeeker.create(name: "Jay", location: "San Francisco, CA", username: "seanb", password: "123", email: "seanb@microsoft.com", image: "https://up.quizlet.com/bq6l2-FW9GY-256s.png")

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

Event.create(recruiter_id: Recruiter.all[0].id, event_date: DateTime.strptime("07/20/2021 18:00", "%m/%d/%Y %H:%M"), name:"Networking Over Beer", location: "Seattle, WA", description: "An evening meetup event with beer", image: "https://lh5.googleusercontent.com/p/AF1QipOOvS3MfpH4Z3wUq3jNc21p5qowyr8_d45V8tjE=w256-h256-k-no-p")
Event.create(recruiter_id: Recruiter.all[0].id, event_date: DateTime.strptime("07/30/2021 11:00", "%m/%d/%Y %H:%M"), name:"Lunch Event", location: "Seattle, WA", description: "Let's go grab lunch and talk about code!", image: "https://media1.fdncms.com/stranger/imager/u/large/27875261/20170730_junebabyforthestranger_0115_mag.png")
Event.create(recruiter_id: Recruiter.all[1].id, event_date: DateTime.strptime("07/22/2021 17:00", "%m/%d/%Y %H:%M"), name:"Coding Workshop", location: "San Francisco, CA", description: "Coding workshop featuring one of our brilliant Tech Leads", image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZYRCl_HM84qbrNcqVLv9lQaoini3tUTifUQ&usqp=CAU")
Event.create(recruiter_id: Recruiter.all[2].id, event_date: DateTime.strptime("07/25/2021 18:00", "%m/%d/%Y %H:%M"), name:"Relax and Social", location: "New York, NY", description: "A relaxing career social event", image: "https://www.gatewaycityarts.com/wp-content/uploads/2020/06/Judds_Bar-256x256.jpg")
Event.create(recruiter_id: Recruiter.all[3].id, event_date: DateTime.strptime("08/3/2021 12:00", "%m/%d/%Y %H:%M"), name:"Lunch and Code", location: "San Francisco, CA", description: "Lunch and code", image: "https://ravishingradish.com/wp-content/uploads/2019/03/galvanize-1140x680.jpg")
Event.create(recruiter_id: Recruiter.all[4].id, event_date: DateTime.strptime("07/28/2021 17:00", "%m/%d/%Y %H:%M"), name:"Social Over Dinner", location: "Houston, TX", description: "Dinner's on us!", image: "https://res.cloudinary.com/sagacity/image/upload/c_crop,h_4000,w_6000,x_0,y_0/c_limit,dpr_auto,f_auto,fl_lossy,q_80,w_1080/TC2058256_tozbyn.jpg")


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
