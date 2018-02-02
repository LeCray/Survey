class CreateBuildingExteriors < ActiveRecord::Migration[5.1]
  def change
    create_table :building_exteriors do |t|
      t.integer :exterior_id

      t.timestamps
    end
  end
end
