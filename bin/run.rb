require_relative '../config/environment'

prompt = TTY::Prompt.new

# prompt.ask = ask a question
# prompt.select = give user options to select // ('question?', ["option1", "option2"])
# prompt.mask = prompt for password but masks what is typed in

profile_choice = prompt.select('Are you a Job Seeker or Recruiter?', ["Job Seeker", "Recruiter"])

if profile_choice == "Job Seeker"
    username = prompt.ask("Name:")
    # password = prompt.mask("Password:")

    current_user = JobSeeker.all.find{|seeker| seeker.name == username}

    puts "Hello #{current_user.name}!"
end

# puts "HELLO WORLD"
