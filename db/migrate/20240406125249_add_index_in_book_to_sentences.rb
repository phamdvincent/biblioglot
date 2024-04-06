class AddIndexInBookToSentences < ActiveRecord::Migration[7.0]
  def change
    add_column :sentences, :index_in_book, :integer
  end
end
