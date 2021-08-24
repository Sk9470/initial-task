class Recruiter < ApplicationRecord
  validates :email, format: { with: Devise.email_regexp }, uniqueness: { case_sensitive: false }
  validates :contact_number, length: { is: 10 }
  has_one :user, dependent: :destroy

  after_commit :assign_role, on: :create
  accepts_nested_attributes_for :user

  private

  def assign_role
    user.user_roles.create!(role: ReferenceDatum::KEY_RECRUITER)
  end
end
