class RenameStatusColumnToWines < ActiveRecord::Migration[5.2]
  def change
    rename_column :wines, :status, :genre
  end
end
