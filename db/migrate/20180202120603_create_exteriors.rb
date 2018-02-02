class CreateExteriors < ActiveRecord::Migration[5.1]
  def change
    create_table :exteriors do |t|
      t.integer :on_campus_residence_hall_id

      t.timestamps
    end
  end
end
