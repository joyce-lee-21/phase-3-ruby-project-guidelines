require_relative '../config/environment'

prompt = TTY::Prompt.new

# prompt.ask = ask a question
# prompt.select = give user options to select // ('question?', ["option1", "option2"])
# prompt.mask = prompt for password but masks what is typed in


































































































































# Home Page Start
loop do
# //Job Seeker is signed in, main menu is prompted
    main_menu_choice = prompt.select('Do you want to view profile, view event list, recruiter matches, or logout?', ["Profile", "Events", "Recruiter Matches", "LOGOUT"])
    # current_user should be used from global variable from login/signup step
    current_user = JobSeeker.first

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
                        current_user.location = new_location[:location]
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
        puts current_user.recruiters
            recruiter_choices = current_user.recruiters.collect{|recruiter| recruiter.name}
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
