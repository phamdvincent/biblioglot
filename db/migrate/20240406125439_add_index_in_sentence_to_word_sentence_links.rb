class AddIndexInSentenceToWordSentenceLinks < ActiveRecord::Migration[7.0]
  def change
    add_column :word_sentence_links, :index_in_sentence, :integer
  end
end
