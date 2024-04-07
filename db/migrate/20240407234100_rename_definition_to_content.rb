class RenameDefinitionToContent < ActiveRecord::Migration[7.0]
  def change
    rename_column(:definitions, :definition, :content)
  end
end
