class Skill < ActiveRecord::Base
    belongs_to :profile
end

# below works
# Skill.first.profile