# == Schema Information
#
# Table name: words
#
#  id          :integer          not null, primary key
#  audio       :string
#  content     :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  language_id :integer
#
class Word < ApplicationRecord
  has_many :word_sentence_links
  has_many :definitions
  belongs_to :language

  validates :content, uniqueness: true

  def populate_word(language, params, word_index_in_sentence, book)
    word_text = params["text"].downcase
    self.content = word_text
    # self.audio = get_audio_storage_path(language, word_text)
    self.audio = "audio_path"
    self.language_id = book.language_id
  end

  def get_audio_data(language, word_text)
    audio_data = AudioService.generate_audio_data(language, word_text, "audio")
    return audio_data
  end

  def put_audio_in_storage(audio_data)
    audio_object_key = StorageService.save_to_storage(audio_data, SecureRandom.uuid, "word")
    return audio_object_key
  end

  def get_audio_storage_path(language, word_text)
    audio_data = get_audio_data(language, word_text)
    audio_object_key = put_audio_in_storage(audio_data)
    return audio_object_key
  end
end
