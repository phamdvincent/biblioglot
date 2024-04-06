class CreateDefinitions < ActiveRecord::Migration[7.0]
  def change
    create_table :definitions do |t|
      t.integer :word_id
      t.string :definition
      t.string :dict_pos
      t.integer :language_id
      t.string :nlp_pos

      t.timestamps
    end
  end
end
