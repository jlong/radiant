class CreatePages < ActiveRecord::Migration[6.0]
  def change
    create_table :pages do |t|
      t.string :title
      t.string :slug,         limit: 100
      t.string :breadcrumb,   limit: 160
      t.integer :status_id,   default: 1, null: false
      t.integer :parent_id
      t.integer :layout_id
      t.integer :published_at
      t.integer :created_by_id
      t.integer :updated_by_id
      t.timestamps
    end

    add_index :pages, :parent_id
    add_index :pages, [:slug, :parent_id]
  end
end
