class CreateExteriorBuildingExteriorQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :exterior_building_exterior_questions do |t|
      t.integer :building_exterior_id

      t.timestamps
    end
  end
end
