class RecruiterPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def permitted_attributes
    [:company_name, :company_address, :contact_number, :email,
     user_attributes: [:password, :email]]
  end

  def sign_up?
    true
  end

  def index?
    user.super_admin?
  end

  def update?
    user.recruiter_id = @record.id || index?
  end

  def show?
    update?
  end

  def destroy?
    update?
  end
end
