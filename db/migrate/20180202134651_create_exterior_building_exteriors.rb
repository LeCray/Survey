class CreateExteriorBuildingExteriors < ActiveRecord::Migration[5.1]
  def change
    create_table :exterior_building_exteriors do |t|

      t.timestamps
    end
  end
end
