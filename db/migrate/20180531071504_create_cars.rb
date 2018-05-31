class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :name
      t.string :car_slug
      t.string :max_speed

      t.timestamps null: false
    end
  end
end
