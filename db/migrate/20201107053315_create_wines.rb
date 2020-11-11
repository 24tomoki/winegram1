class CreateWines < ActiveRecord::Migration[5.2]
  def change
    create_table :wines do |t|
      t.string :name
      t.text :explanation
      t.string :image_id
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
