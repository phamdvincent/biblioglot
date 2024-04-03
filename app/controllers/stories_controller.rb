# require_relative "../services/audio/audio_service"
# require_relative "../services/dictionary/dictionary_service"
require_relative "../services/nlp/nlp_service"
# require_relative "../services/translation/translation_service"
# require_relative "../services/storage/storage_service"

# require "json"
# require "securerandom"
include Nlp

class StoriesController < ApplicationController
  def index
    @story = Sentence.where(book_id: 1)
  end

  def show
  end

  def new

  end

  def process_text
    language = 'es'
    story_text = params[:story_text]
    @processed_text = NlpService.get_nlp(language, story_text) # nlp
    # @translations = []
    # @words = []
    # @audio_data
    @processed_text.each do |item|

    #   @translations.append(get_translation(language, item["sentence"])) # translations
    #   translation = get_translation(language, item["sentence"])

    #   get_words_json(language, item["tokens"]) # words

    #   @audio_data = generate_audio_data(language, item["sentence"]) # audio
    #   audio_object_key = save_audio_to_storage(@audio_data, "sentence") # storage

    # sentence = Sentence.new({content: item["sentence"], language_id: 1, english_translation: translation, book_id: 1, audio: audio_object_key})
      sentence = Sentence.new({content: item["sentence"], language_id: 1, english_translation: "This is translation", book_id: 1, audio: "This is audio"})
      sentence.save
    end
    redirect_to "/books"
    # redirect_to '/', locals: { processed_text: @processed_text }
    # redirect_to story_path(processed_text: @process_text)

  end

  # private

  #   def get_translation(language, sentence)
  #     translated_sentence = Translation_Service.get_translation('es', sentence)
  #     return translated_sentence
  #   end

  #   def get_words_json(language, tokens)

  #     tokens.each do |token|
  #       if token["upos"] != "PUNCT"
  #         word = token["text"].downcase

  #         audio_word = generate_audio_data(language, word)
  #         audio_object_key = save_audio_to_storage(audio_word, 'word')

  #         word_json_list = Dictionary_Service.get_word_json_list(language, word)
  #         word_json_list.each do |item|
  #           part_of_speech = item["pos"]
  #           if item["senses"].at(0).key?("glosses")
  #             definition = item["senses"].at(0)["glosses"]
  #           else
  #             definition = "not found"
  #           end

  #           word_db = Word.new({word: word, part_of_speech: part_of_speech, definition: definition, audio: audio_object_key, language_id: 1})
  #           word_db.save
  #         end
  #         # word_hash = {"word": word, "json": word_json_list}
  #         # @words.append(word_hash)
  #       end
  #     end

  #   end

  #   def generate_audio_data(language, content)
  #     return Audio_Service.generate_audio(language, content)
  #   end

  #   def save_audio_to_storage(audio_data, type)
  #     content = audio_data
  #     filename = SecureRandom.uuid
  #     content_type = type
  #     return Storage_Service.save_to_storage(content, filename, content_type)
  #   end

end
