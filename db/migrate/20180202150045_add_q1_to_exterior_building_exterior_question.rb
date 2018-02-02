class AddQ1ToExteriorBuildingExteriorQuestion < ActiveRecord::Migration[5.1]
  def change
    add_column :exterior_building_exterior_questions, :q1, :boolean
  end
end
