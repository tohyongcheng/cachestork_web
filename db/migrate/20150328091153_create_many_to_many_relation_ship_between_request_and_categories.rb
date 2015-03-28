class CreateManyToManyRelationShipBetweenRequestAndCategories < ActiveRecord::Migration
  def change
    create_table :categories_requests, id: false do |t|
      t.belongs_to :request, index: true
      t.belongs_to :category, index: true
    end
  end
end
