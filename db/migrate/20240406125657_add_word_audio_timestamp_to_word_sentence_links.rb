class AddWordAudioTimestampToWordSentenceLinks < ActiveRecord::Migration[7.0]
  def change
    add_column :word_sentence_links, :word_audio_timestamp, :string
  end
end
