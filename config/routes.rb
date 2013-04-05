ElasticSearchSample::Application.routes.draw do
  resources :jobs

  resources :users

  root to: "users#index"
end
