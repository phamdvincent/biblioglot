class CreateWordSentenceLinks < ActiveRecord::Migration[7.0]
  def change
    create_table :word_sentence_links do |t|
      t.integer :sentence_id
      t.integer :word_id
      t.integer :language_id
      t.integer :book_id

      t.timestamps
    end
  end
end
