AdMan::Engine.routes.draw do
  resources :keywords
  resources :advertisements do
    collection do
      get 'click_through/:id' => "advertisements#click_through", :as => :click_through
      get 'get_ad/:div/:key/:size' => 'advertisements#get_ad', :as => :get_ad
    end
  end

  root :to => "advertisements#index"

end
