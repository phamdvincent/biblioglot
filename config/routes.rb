Rails.application.routes.draw do
  resources :definitions
  resources :words
  resources :word_sentence_links
  resources :sentences
  resources :progresses
  resources :languages
  resources :books
  resources :stories
  root to: "home#index"

  post("/books/process_text", { :controller => "books", :action => "process_text" })

  devise_for :users


end
