# require_relative "../services/audio"
# require_relative "../services/dictionary"
require_relative "../services/nlp/nlp_service"
require_relative "../services/translation/translation_service"
# require_relative "../services/storage"
# require "~/biblioglot/app/services/translation"

# include NLP_Service
# include Translation_Service

require "json"

# nlp = NLP_Processor

class StoriesController < ApplicationController
  def index
  end

  def new

  end

  def process_text
    story_text = params[:story_text]
    @processed_text = NLP_Service.get_nlp('es', story_text)
    @sentences = []
    @translations = []
    @processed_text.each do |item|
      @translations.append(Translation_Service.get_translation('es', item["sentence"]))
      
    end
    puts @translations
    # @processed_text = "Hello World"
    # puts @processed_text
    # puts @processed_text.class

  end
end
