class HoboMigration2 < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.string   :name
      t.datetime :created_at
      t.datetime :updated_at
    end

    create_table :project_products do |t|
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :project_id
      t.integer  :product_id
    end
    add_index :project_products, [:project_id]
    add_index :project_products, [:product_id]
  end

  def self.down
    drop_table :products
    drop_table :project_products
  end
end
