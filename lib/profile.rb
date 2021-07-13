class Profile < ActiveRecord::Base
    belongs_to :user, polymorphic: true

    has_many :skills
end

# below works
# Profile.first.user #=>which is an recruiter instance 
# Profile.last.user #=>which is an job seeker instance 