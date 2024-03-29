class StoriesController < ApplicationController
  def index
    render({ :template => "stories/index"})
  end
end
