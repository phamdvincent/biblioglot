class RemoveDefinitionFromWords < ActiveRecord::Migration[7.0]
  def change
    remove_column :words, :definition, :string
  end
end
