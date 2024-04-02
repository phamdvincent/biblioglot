class AddAudioToSentences < ActiveRecord::Migration[7.0]
  def change
    add_column :sentences, :audio, :string
  end
end
