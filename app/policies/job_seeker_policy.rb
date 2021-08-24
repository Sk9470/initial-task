class JobSeekerPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def permitted_attributes
    [:first_name, :last_name, :contact_number, :email, :experience, { technologies_known: [] }, :display_pic,
     user_attributes: [:password, :email], job_seeker_skills_attributes: [:skill_id]]
  end

  def sign_up?
    true
  end

  def index?
    (user.roles & [ReferenceDatum::KEY_SUPER_ADMIN, ReferenceDatum::KEY_RECRUITER]).any?
  end

  def update?
    user.id == @record.user.id || user.super_admin?
  end

  def show?
    (user.roles & [ReferenceDatum::KEY_RECRUITER, ReferenceDatum::KEY_SUPER_ADMIN]).any? || user.id == @record.user.id
  end

  def destroy?
    update?
  end
end
