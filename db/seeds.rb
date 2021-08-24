# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Doorkeeper::Application.create!(name: 'job_portal', redirect_uri: 'urn:ietf:wg:oauth:2.0:oob') unless Doorkeeper::Application.find_by(name: 'job_portal')
ReferenceDatum.find_or_create_by!(key: 'super_admin', label: 'SuperAdmin', data_type: 'user_role')
ReferenceDatum.find_or_create_by!(key: 'recruiter', label: 'Recruiter', data_type: 'user_role')
ReferenceDatum.find_or_create_by!(key: 'job_seeker', label: 'Job Seeker', data_type: 'user_role')
Skill.find_or_create_by(skill: 'C')
Skill.find_or_create_by(skill: 'Pyhton')
Skill.find_or_create_by(skill: 'Java')
Skill.find_or_create_by(skill: 'Scala')
Skill.find_or_create_by(skill: 'Java Script')
Skill.find_or_create_by(skill: 'React')





