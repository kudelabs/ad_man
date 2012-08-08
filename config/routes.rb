AdMan::Engine.routes.draw do
  resources :keywords
  resources :advertisements

  root :to => "advertisements#index"

end
