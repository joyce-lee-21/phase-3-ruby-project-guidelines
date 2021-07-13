require_relative '../config/environment'

prompt = TTY::Prompt.new

# prompt.ask = ask a question
# prompt.select = give user options to select // ('question?', ["option1", "option2"])
# prompt.mask = prompt for password but masks what is typed in

# profile_choice = prompt.select('Are you a Job Seeker or Recruiter?', ["Job Seeker", "Recruiter"])

# if profile_choice == "Job Seeker"
#     username = prompt.ask("Name:")
#     # password = prompt.mask("Password:")

#     current_user = JobSeeker.all.find{|seeker| seeker.name == username}

#     puts "Hello #{current_user.name}!"
# end

# puts "HELLO WORLD"
current_user = nil

loop do
    sign_up_or_login = prompt.select("Please login or signup", ["Login", "Signup"])

    if sign_up_or_login == "Login"
        recruiter_or_job_seeker = prompt.select("Are you a recruiter or job seeker?", ["Recruiter", "Job seeker", "Go back"])
        if recruiter_or_job_seeker == "Recruiter"
            username = prompt.ask("Username:")
            password = prompt.mask("Password:")

            current_user = Recruiter.all.find{|recruiter| recruiter.username == username &&  recruiter.password == password}
                if current_user != nil
                    puts "Hello #{current_user.name}!"
                    sign_up_or_login = "Exit"
################################ should connect with view profile?
                else 
                    puts "Incorrect username or password."
                end

        elsif recruiter_or_job_seeker == "Job seeker"
                username = prompt.ask("Username:")
                password = prompt.mask("Password:")

                current_user = JobSeeker.all.find{|job_seeker| job_seeker.username == username &&  job_seeker.password == password}
                    if current_user != nil
                        puts "Hello #{current_user.name}!"
                        sign_up_or_login = "Exit"
################################ should connect with view profile?
                    else 
                        puts "Incorrect username or password."
                    end

        end
            
    else #signup
        recruiter_or_job_seeker = prompt.select("Are you a recruiter or job seeker?", ["Recruiter", "Job seeker", "Go back"])
        if recruiter_or_job_seeker == "Recruiter"
            username = prompt.ask("Username:", required: true)
            email = prompt.ask("Email:")
            name = prompt.ask("Your name:")
            location = prompt.ask("Your location(ie. Seattle, WA):")
            company_name = prompt.ask("Company name:")
            password = prompt.mask("Password:", required: true)

            current_user = Recruiter.create(name: name, company_name: company_name, location: location, username: username, password: password, email: email)
            
            puts "Hello #{current_user.name}!"

            current_user_profile = Profile.create(user_id: current_user.id, user_type: "Recruiter")
            puts "Profile created!"

            skill_input = prompt.collect do
                key(:name).ask("Add language")
                key(:level).ask("What level are you? Rating from 1 to 10", convert: :int)
            end

            loop do
                add_skill_to_profile = prompt.select("Do you want to add another skill that you are looking for to your profile?", ["Yes", "No"])
                if add_skill_to_profile == "Yes"
                    skill_input = prompt.collect do
                        key(:name).ask("Add language")
                        key(:level).ask("What level are you? Rating from 1 to 10", convert: :int)
                    end

                    # puts "current_user", current_user.profile.id, skill_input[:name], skill_input[:level]
                    current_user.add_skill(skill_input[:name], skill_input[:level])
                    puts "skill added"

                end
################################ should connect with view profile?
            break if add_skill_to_profile == "No" #back to login/signup
            end


        elsif recruiter_or_job_seeker == "Job seeker"
            username = prompt.ask("Username:", required: true)
            email = prompt.ask("Email:")
            name = prompt.ask("Your name:")
            location = prompt.ask("Your location(ie. Seattle, WA):")
            password = prompt.mask("Password:", required: true)

            current_user = JobSeeker.create(name: name, location: location, username: username, password: password, email: email)
            
            puts "Hello #{current_user.name}!"

            current_user_profile = Profile.create(user_id: current_user.id, user_type: "JobSeeker")
            puts "Profile created!"

            skill_input = prompt.collect do
                key(:name).ask("Add language")
                key(:level).ask("What level are you? Rating from 1 to 10", convert: :int)
            end

            loop do
                add_skill_to_profile = prompt.select("Do you want to add another skill that you have to your profile?", ["Yes", "No"])
                if add_skill_to_profile == "Yes"
                    skill_input = prompt.collect do
                        key(:name).ask("Add language")
                        key(:level).ask("What level are you? Rating from 1 to 10", convert: :int)
                    end

                    current_user.add_skill(skill_input[:name], skill_input[:level])
                    puts "skill added"
                end
################################ should connect with view profile?
            break if add_skill_to_profile == "No" #back to login/signup
            end

        end

    end

break if sign_up_or_login == "Exit"

end