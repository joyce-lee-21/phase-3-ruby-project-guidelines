class Event < ActiveRecord::Base
    belongs_to :recruiter

    has_many :add_events
    has_many :job_seekers, through: :add_events
end

# below works:
# Event.first.recruiter
# Event.first.add_events
# Event.first.job_seekers
# Event.last.job_seekers