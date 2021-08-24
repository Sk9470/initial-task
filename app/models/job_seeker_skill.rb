class JobSeekerSkill < ApplicationRecord
  belongs_to :job_seeker
  belongs_to :skill
  validates :skill_id, uniqueness: { scope: :job_seeker_id }
end
