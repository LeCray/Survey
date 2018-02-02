class AddExteriorIdToExteriorBuildingExteriors < ActiveRecord::Migration[5.1]
  def change
    add_column :exterior_building_exteriors, :exterior_id, :integer
  end
end
