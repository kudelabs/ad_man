AdMan::Engine.routes.draw do
  resources :keywords
  resources :advertisements
  root :to => "advertisements#index"
  
  match '/advertisements/click_through/:id' => 'advertisements#click_through', :as => "click_through"
  match '/advertisements/get_ad/:id' => 'advertisements#get_ad'
  
end
