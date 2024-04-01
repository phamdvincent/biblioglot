require_relative "../services/audio/audio_service"
require_relative "../services/dictionary/dictionary_service"
require_relative "../services/nlp/nlp_service"
require_relative "../services/translation/translation_service"
# require_relative "../services/storage"
# require "~/biblioglot/app/services/translation"

require "json"

class StoriesController < ApplicationController
  def index
  end

  def new

  end

  def process_text
    language = 'es'
    story_text = params[:story_text]
    @processed_text = NLP_Service.get_nlp(language, story_text)
    @sentences = []
    @translations = []
    @words = []
    @processed_text.each do |item|
      # @translations.append(get_translation(language, item["sentence"])) # translations
      # get_words_json(language, item["tokens"]) # words
      # audio

    end

    puts @words
    puts @words.class

  end

  private

    def get_translation(language, sentence)
      translated_sentence = Translation_Service.get_translation('es', sentence)
      return translated_sentence
    end

    def get_words_json(language, tokens)

      tokens.each do |token|
        if token["upos"] != "PUNCT"
          word = token["text"].downcase
          word_json_list = Dictionary_Service.get_word_json_list(language, word)
          word_hash = {"word": word, "json": word_json_list}
          @words.append(word_hash)
        end
      end

    end

end
