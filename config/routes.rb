Rails.application.routes.draw do
  resources :words
  resources :word_sentence_links
  resources :sentences
  resources :progresses
  resources :languages
  resources :books
  resources :stories
  #get("/", { :controller => "stories", :action => "index"})
  root to: "stories#index"
  post("/stories/process_text", { :controller => "stories", :action => "process_text" })
  # get("/stories/new", { :controller => "stories", :action => "new"})
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"



end
