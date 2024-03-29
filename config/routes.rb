Rails.application.routes.draw do
  resources :words
  resources :word_sentence_links
  resources :sentences
  resources :progresses
  resources :languages
  resources :books
  #get("/", { :controller => "stories", :action => "index"})
  root to: "stories#index"
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"



end
