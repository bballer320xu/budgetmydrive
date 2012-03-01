Budgetmydrive::Application.routes.draw do

  root :to => 'pages#index'
  get "privacy" => "pages#privacy"
  get "terms" => "pages#terms"
  post "get_data" => "pages#get_data"
  post "update_model_make" => "pages#update_model_make"
  post "update_model_name" => "pages#update_model_name"
  post "update_model_transmission" => "pages#update_model_transmission"
  post "update_model_engine_size" => "pages#update_model_engine_size"
end
