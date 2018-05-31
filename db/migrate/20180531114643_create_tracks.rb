class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :country
      t.string :name
      t.string :timezone
      t.string :surface_type

      t.timestamps null: false
    end
  end
end
