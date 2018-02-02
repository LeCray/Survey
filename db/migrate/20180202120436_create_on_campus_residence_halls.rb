class CreateOnCampusResidenceHalls < ActiveRecord::Migration[5.1]
  def change
    create_table :on_campus_residence_halls do |t|
      t.integer :user_id

      t.timestamps
    end
  end
end
