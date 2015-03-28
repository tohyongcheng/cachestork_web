class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :name
      t.string :high_school
      t.string :country

      t.timestamps
    end
  end
end
