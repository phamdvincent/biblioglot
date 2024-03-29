class CreateWords < ActiveRecord::Migration[7.0]
  def change
    create_table :words do |t|
      t.string :word
      t.string :part_of_speech
      t.string :definition
      t.string :audio
      t.integer :language_id

      t.timestamps
    end
  end
end
