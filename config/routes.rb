AdMan::Engine.routes.draw do
  resources :keywords
  resources :advertisements

  root :to => "advertisements#index"
  match 'ad_man/advertisements/click_through' => 'advertisements#click_through'

end
