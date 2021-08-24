class CreateRecruiters < ActiveRecord::Migration[6.1]
  def change
    create_table :recruiters do |t|
      t.string :company_name, null: false
      t.string :company_address
      t.string :contact_number
      t.string :email
      t.timestamps
    end
  end
end
