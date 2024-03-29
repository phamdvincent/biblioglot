class CreateSentences < ActiveRecord::Migration[7.0]
  def change
    create_table :sentences do |t|
      t.integer :book_id
      t.string :english_translation
      t.string :content
      t.integer :language_id

      t.timestamps
    end
  end
end
