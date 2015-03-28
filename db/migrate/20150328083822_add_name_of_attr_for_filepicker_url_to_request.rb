class AddNameOfAttrForFilepickerUrlToRequest < ActiveRecord::Migration
  def change
    add_column :requests, :filepicker_url, :string
  end
end
