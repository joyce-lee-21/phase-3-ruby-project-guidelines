require_relative '../config/environment'

prompt = TTY::Prompt.new
# prompt.ask = ask a question
# prompt.select = give user options to select // ('question?', ["option1", "option2"])
# prompt.mask = prompt for password but masks what is typed in
# profile_choice = prompt.select('Are you a Job Seeker or Recruiter?', ["Job Seeker", "Recruiter"])

def jobseeker_homepage(current_user)
    prompt = TTY::Prompt.new
    # Home Page Start
    loop do
    # //Job Seeker is signed in, main menu is prompted
        main_menu_choice = prompt.select('Do you want to view profile, view event list, recruiter matches, or logout?', ["Profile", "Events", "Recruiter Matches", "LOGOUT"])
        # current_user should be used from global variable from login/signup step

    
        # Main Menu
        if main_menu_choice == "Profile"
            # Profile Menu Start
            loop do
                profile_choice = prompt.select('Select from:', ["Skills", "Location", "BACK TO MAIN MENU"])
                if profile_choice == "Skills"
                    # Skills Menu Start
                    loop do
                        puts "Skills: #{current_user.view_skills}"
                        skills_selection = prompt.select('Do you want to add, or delete skills?', ["Add", "Delete", "BACK"])
                        if skills_selection == "Add"
                            new_skill = prompt.collect{
                                key(:name).ask("Add skill name in TitleCase (i.e., JavaScript):")
                                key(:level).ask("Add skill level:")
                            }
                            current_user.add_skill(new_skill[:name], new_skill[:level])
                            puts "#{current_user.name} skill: #{new_skill[:name]} added!"
                            skills_selection
                        elsif skills_selection == "Delete"
                            remove_skill = prompt.collect{key(:name).ask("Delete skill name:")}
                            current_user.delete_skill(remove_skill[:name])
                            puts "#{current_user.name} skill: #{remove_skill[:name]} deleted!"
                            skills_selection
                        else skills_selection == "BACK"
                            break
                        end
                    end
                    # Skills Menu End
                elsif profile_choice == "Location"
                    # Location Menu Start
                    loop do
                        puts "Location: #{current_user.location}"
                        location_selection = prompt.select('Do you want to edit your location?', ["Edit", "BACK"])
                        if location_selection == "Edit"
                            new_location = prompt.collect{
                                key(:location).ask("City, State (i.e., New York, NY):")
                            }
                            current_user.edit_location(new_location[:location])
                            puts "#{current_user.name} location: #{current_user.location} updated!"
                            location_selection
                        else location_selection == "BACK"
                            break
                        end
                    end
                else profile_choice == "BACK TO MAIN MENU"
                    break
                end
            end
            # Profile Menu End
        elsif main_menu_choice == "Events"
            # Event Menu Start
            puts current_user.view_events
            loop do
                event_choices = current_user.view_events
                event_selection = prompt.select('Do you want to delete event(s)?', ["Delete", "BACK TO MAIN MENU"])
                if event_selection == "Delete"
                    delete_event = prompt.select("Select an event to delete:", event_choices)
                    current_user.delete_events(delete_event)
                    puts "Event: #{delete_event} deleted!"
                    event_selection
                else event_selection == "BACK TO MAIN MENU"
                    break
                end
            end
            # Event Menu End
        elsif main_menu_choice == "Recruiter Matches"
            # Recruiter Menu Start
            # Returns all recruiters matched and asks for recruiter selection:
            puts current_user.show_match #MATCH LOGIC METHOD USED HERE!!
                recruiter_choices = current_user.show_match.collect{|recruiter| recruiter.name} #MATCH LOGIC METHOD USED HERE!!
                match_selection = prompt.select('Select a match:', recruiter_choices)
                # Shows recruiter selected and asks for event selection:
                puts match_selection
                # not sure about the below code
                    event_choices = match_selection.events
                    event_selection = prompt.select('Select an event to add:', event_choices)
                    # Adds selected event to job seeker profile
                    current_user.add_events(event_selection)
                    puts "Event: #{add_event} added!"
            # Recruiter Menu End
        else main_menu_choice == "LOGOUT"
            puts "Logged out."
            break
        end
    end
    # Home Page End
end

def recruiter_homepage(current_user)
    prompt = TTY::Prompt.new
    # Home Page Start
    loop do
    # //Job Seeker is signed in, main menu is prompted
        main_menu_choice = prompt.select('Do you want to view profile, view event list, job-seeker matches, or logout?', ["Profile", "Events", "Job-Seeker Matches", "LOGOUT"])
        # current_user should be used from global variable from login/signup step

        # Main Menu
        if main_menu_choice == "Profile"
            # Profile Menu Start
            loop do
                profile_choice = prompt.select('Select from:', ["Skills", "Location", "Company Name", "BACK TO MAIN MENU"])
                if profile_choice == "Skills"
                    # Skills Menu Start
                    loop do
                        puts "Skills: #{current_user.view_skills}"
                        skills_selection = prompt.select('Do you want to add, or delete skills?', ["Add", "Delete", "BACK"])
                        if skills_selection == "Add"
                            new_skill = prompt.collect{
                                key(:name).ask("Add skill name in TitleCase (i.e., JavaScript):")
                                key(:level).ask("Add skill level:")
                            }
                            current_user.add_skill(new_skill[:name], new_skill[:level])
                            puts "#{current_user.name} skill: #{new_skill[:name]} added!"
                            skills_selection
                        elsif skills_selection == "Delete"
                            remove_skill = prompt.collect{key(:name).ask("Delete skill name:")}
                            current_user.delete_skill(remove_skill[:name])
                            puts "#{current_user.name} skill: #{remove_skill[:name]} deleted!"
                            skills_selection
                        else skills_selection == "BACK"
                            break
                        end
                    end
                    # Skills Menu End
                elsif profile_choice == "Location"
                    # Location Menu Start
                    loop do
                        puts "Location: #{current_user.location}"
                        location_selection = prompt.select('Do you want to edit your location?', ["Edit", "BACK"])
                        if location_selection == "Edit"
                            new_location = prompt.collect{
                                key(:location).ask("City, State (i.e., New York, NY):")
                            }
                            current_user.edit_location(new_location[:location])
                            puts "#{current_user.name} location: #{current_user.location} updated!"
                            location_selection
                        else location_selection == "BACK"
                            break
                        end
                    end
                    # Location Menu End
                elsif profile_choice == "Company Name"
                    # Company Name Menu Start
                    loop do
                        puts "Company Name: #{current_user.company_name}"
                        company_selection = prompt.select('Do you want to edit your Company?', ["Edit", "BACK"])
                        if company_selection == "Edit"
                            new_company = prompt.collect{
                                key(:company_name).ask("Company Name:")
                            }
                            current_user.edit_company_name(new_company[:company_name])
                            puts "#{current_user.name} company: #{current_user.company_name} updated!"
                            company_selection
                        else company_selection == "BACK"
                            break
                        end
                    end
                    # Company Name Menu End
                else profile_choice == "BACK TO MAIN MENU"
                    break
                end
            end
            # Profile Menu End
        elsif main_menu_choice == "Events"
            # Event Menu Start
            puts current_user.view_events
            loop do
                event_choices = current_user.view_events
                event_selection = prompt.select('Do you want to add, edit, or delete event(s)?', ["Add", "Edit", "Delete", "BACK TO MAIN MENU"])
                if event_selection == "Add"
                    add_e = prompt.collect{key(:description).ask("Add Event Description:")}
                    current_user.add_event(add_e)
                    puts "Event: #{add_e} added!"
                    event_selection
                elsif event_selection == "Edit"
                    edit_event = prompt.select("Select event to edit:", event_choices)
                    puts edit_event
                    updated_event = prompt.collect{
                        key(:event_date).ask("Edit event date:")
                        key(:location).ask("Edit event location:")
                        key(:description).ask("Edit event description:")
                    }
                    current_user.edit_event(edit_event, updated_event)
                elsif event_selection == "Delete"
                    delete_event = prompt.select("Select an event to delete:", event_choices)
                    current_user.delete_events(delete_event)
                    puts "Event: #{delete_event} deleted!"
                    event_selection
                else event_selection == "BACK TO MAIN MENU"
                    break
                end
            end
            # Event Menu End
        elsif main_menu_choice == "Job-Seeker Matches"
            # Job-Seeker Matches Menu Start
            # Returns all job seekers matched and asks for recruiter selection:
            puts current_user.show_match #MATCH LOGIC METHOD USED HERE!!
                job_seeker_choices = current_user.show_match.collect{|seeker| seeker.name} #MATCH LOGIC METHOD USED HERE!!
                match_selection = prompt.select('Select a match:', job_seeker_choices)
                # Shows recruiter selected and asks for event selection:
                puts match_selection
                    selected_user = current_user.show_match.find_by(name: match_selection)
                    puts "Email: #{selected_user.email_address}"
            # Job-Seeker Matches Menu End
        else main_menu_choice == "LOGOUT"
            puts "Logged out."
            break
        end
    end
    # Home Page End
end

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
                    recruiter_homepage(current_user)
                else 
                    puts "Incorrect username or password."
                end

        elsif recruiter_or_job_seeker == "Job seeker"
            username = prompt.ask("Username:")
            password = prompt.mask("Password:")

            current_user = JobSeeker.all.find{|job_seeker| job_seeker.username == username &&  job_seeker.password == password}
                if current_user != nil
                    puts "Hello #{current_user.name}!"
                    jobseeker_homepage(current_user)
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