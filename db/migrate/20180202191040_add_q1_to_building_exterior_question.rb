class AddQ1ToBuildingExteriorQuestion < ActiveRecord::Migration[5.1]
  def change
    add_column :building_exterior_questions, :q1, :boolean
  end
end
