class CreateSongs < ActiveRecord::Migration[7.0]
  def change
    create_table :songs do |t|
      t.string :name
      t.string :album
      t.string :artist

      t.timestamps
    end
  end
end
