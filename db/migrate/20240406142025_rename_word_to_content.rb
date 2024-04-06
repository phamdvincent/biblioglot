class RenameWordToContent < ActiveRecord::Migration[7.0]
  def change
    rename_column(:words, :word, :content)
  end
end
