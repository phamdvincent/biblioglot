Rails.application.routes.draw do
  resources :definitions
  resources :words
  resources :word_sentence_links
  resources :sentences
  resources :progresses
  resources :languages
  resources :books
  resources :stories
  # root to: "home#index"
  root to: "books#index"
  #get("/", { :controller => "stories", :action => "index"})
  # post("/stories/process_text", { :controller => "stories", :action => "process_text" })
  post("/books/process_text", { :controller => "books", :action => "process_text" })
  # get("/stories/new", { :controller => "stories", :action => "new"})
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

end
