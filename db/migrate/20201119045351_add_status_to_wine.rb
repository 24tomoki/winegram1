class AddStatusToWine < ActiveRecord::Migration[5.2]
  def change
    add_column :wines, :status, :integer
  end
end
