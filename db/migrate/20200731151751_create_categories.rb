class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string      :name, null: false
      t.datetime    :created_at, null: false
      t.datetime    :updated_at, null: false
      t.string      :ancestry, :index
      t.timestamps
    end
  end
end
