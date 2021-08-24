class JobSeeker < ApplicationRecord
  validates :email, format: { with: Devise.email_regexp }, uniqueness: { case_sensitive: false }
  validates :contact_number, length: { is: 10 }

  has_one :user, dependent: :destroy
  has_many :job_seeker_skills, dependent: :destroy
  has_many :skills, through: :job_seeker_skills
  has_one_attached :display_pic

  after_commit :assign_role, on: :create
  scope :experience_order, -> { reorder(experience: :desc)}

  accepts_nested_attributes_for :user
  accepts_nested_attributes_for :job_seeker_skills, allow_destroy: true


  def self.filter(params, current_user)
    where_conditions = []
    where_values = {}
    add_search_query(where_conditions, where_values, params[:query]) if params[:last_name] || params[:query]
    add_experience_filter(where_conditions, where_values, params[:experience]) if params[:experience]
    add_known_technologies_filter(where_conditions, where_values, params[:skills]) if params[:skills]
    JobSeeker.distinct.joins(:job_seeker_skills).where(where_conditions.join(' and '), where_values).experience_order
  end

  def self.add_search_query(where_conditions, where_values, query)
    where_conditions  << 'concat(first_name,last_name,email) LIKE :query'
    where_values[:query] = "%#{query}%"
  end

  def self.add_experience_filter(where_conditions, where_values, experience)
    where_conditions << 'experience = :experience'
    where_values[:experience] = experience
  end

  def self.add_known_technologies_filter(where_conditions, where_values, skills)
    where_conditions << 'skill_id in (:skills)'
    where_values[:skills] = skills
  end

  def display_pic_url
    return unless display_pic.attached?

    Rails.application.routes.url_helpers.url_for(display_pic)
  end
  private

  def assign_role
    user.user_roles.create!(role: ReferenceDatum::KEY_JOB_SEEKER)
  end
end
