class AddUrlToVideo < ActiveRecord::Migration
  def change
    add_column :videos, :thumbnail_url, :text
    add_column :videos, :description, :text
    add_column :videos, :video_id, :string
  end
end
