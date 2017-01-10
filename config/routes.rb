Rails.application.routes.draw do
  
  get "show_pass" => "words#show_pass", :as => "show_pass"
  
  resources :words
  
  root 'home#index'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
