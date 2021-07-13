class AddEvent < ActiveRecord::Base
    belongs_to :job_seeker
    belongs_to :event
end

# below works:
# AddEvent.first.event
# AddEvent.first.job_seeker