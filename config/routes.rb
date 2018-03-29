Rails.application.routes.draw do
  get 'cv_generator/index'
  post 'display/' => 'cv_generator#display'
  
  root 'cv_generator#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
