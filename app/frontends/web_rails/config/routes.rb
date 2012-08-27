Web::Application.routes.draw do

  root to: 'pages#index'

  resources :gatherings

end
