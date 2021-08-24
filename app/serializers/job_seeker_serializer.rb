class JobSeekerSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :experience
  has_many :skills

  def experience
    object.experience.to_s + 'years'
  end
end
