class RenameExplanationColumnToWines < ActiveRecord::Migration[5.2]
  def change
    rename_column :wines, :explanation, :description
  end
end
