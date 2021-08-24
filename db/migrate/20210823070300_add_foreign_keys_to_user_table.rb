class AddForeignKeysToUserTable < ActiveRecord::Migration[6.1]
  def change
    add_reference :users, :job_seeker, foreign_key: true
    add_reference :users, :recruiter, foreign_key: true
  end
end
