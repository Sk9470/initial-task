class CreateSkills < ActiveRecord::Migration[6.1]
  def change
    create_table :skills do |t|
      t.string :skill
      t.timestamps
    end
    create_table :job_seeker_skills do |t|
      t.references :job_seeker, foreign_key: true
      t.references :skill, foreign_key: true
      t.timestamps
    end
  end
end
