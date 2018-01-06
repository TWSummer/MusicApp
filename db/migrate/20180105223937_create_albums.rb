class CreateAlbums < ActiveRecord::Migration[5.1]
  def change
    create_table :albums do |t|
      t.string :title, presence: true
      t.integer :year, presence: true
      t.integer :band_id, presence: true
      t.boolean :studio, presence: true
      t.timestamps
    end

    add_index :albums, :band_id
  end
end
