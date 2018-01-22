class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.decimal :telephone
      t.decimal :mobile
      t.string :home_province
      t.string :organisation
      t.string :position
      t.string :title
      t.string :current_campus
      t.string :future_campus
      t.string :description

      t.timestamps
    end
  end
end
