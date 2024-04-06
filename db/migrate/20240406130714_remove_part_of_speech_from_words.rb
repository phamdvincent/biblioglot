class RemovePartOfSpeechFromWords < ActiveRecord::Migration[7.0]
  def change
    remove_column :words, :part_of_speech, :string
  end
end
