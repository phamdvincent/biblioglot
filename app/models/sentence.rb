# == Schema Information
#
# Table name: sentences
#
#  id                  :integer          not null, primary key
#  audio               :string
#  content             :string
#  english_translation :string
#  index_in_book       :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  book_id             :integer
#  language_id         :integer
#

require_relative "../services/nlp/nlp_service"
include Nlp

require_relative "../services/translation/translation_service"
include Translation

require_relative "../services/dictionary/dictionary_service"
include Dictionary

require_relative "../services/audio/audio_service"
include Audio

require_relative "../services/storage/storage_service"
include Storage

require "securerandom"

class Sentence < ApplicationRecord
  belongs_to :book
  has_many :word_sentence_links
  has_many :words, through: :word_sentence_links

  def populate_sentence(language, params, sentence_index_in_book, book)
    sentence_text = params["sentence"]
    self.content = sentence_text
    self.audio = get_audio_storage_path(language, sentence_text)
    self.english_translation = get_translation(language, sentence_text)
    self.index_in_book = sentence_index_in_book
    self.book_id = book.id
    self.language_id = book.language_id
  end

  def get_audio_timestamps(language, sentence_text)
    audio_timestamps_for_words = AudioService.generate_audio_data(language, sentence_text, "timestamp")
    return audio_timestamps_for_words
  end

  private

  def get_translation(language, sentence_text)
    translation = TranslationService.get_translation(language, sentence_text)
    return translation
  end

  def get_audio_data(language, sentence_text)
    audio_data = AudioService.generate_audio_data(language, sentence_text, "audio")
    return audio_data
  end

  def put_audio_in_storage(audio_data)
    audio_object_key = StorageService.save_to_storage(audio_data, SecureRandom.uuid, "sentence")
    return audio_object_key
  end

  def get_audio_storage_path(language, sentence_text)
    audio_data = get_audio_data(language, sentence_text)
    audio_object_key = put_audio_in_storage(audio_data)
    return audio_object_key
  end
end
