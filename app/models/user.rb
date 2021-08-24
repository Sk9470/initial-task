class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :lockable, :timeoutable, :trackable
  has_many :user_roles, dependent: :destroy
  belongs_to :recruiter, optional: true
  belongs_to :job_seeker, optional: true

  def roles
    user_roles.pluck(:role)
  end

  # ReferenceDatum.where(data_type: 'user_role').pluck(:key).each do |role|
  #   define_method "is_#{role}?" do
  #     (roles & [role]).any?
  #   end
  # end
end
