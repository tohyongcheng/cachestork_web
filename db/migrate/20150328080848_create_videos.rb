class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.text :title
      t.text :url
      t.references :category, index: true

      t.timestamps
    end
  end
end
