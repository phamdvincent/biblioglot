require_relative "../services/nlp/nlp_service"
include NLP_Processor
require "json"

# nlp = NLP_Processor

class StoriesController < ApplicationController
  def index
  end

  def new

  end

  def process_text
    story_text = params[:story_text]
    @processed_text = JSON.generate(get_nlp_json(story_text, 'es'))
    # @processed_text = "Hello World"
    puts @processed_text

    
  end
end
