AdMan::Engine.routes.draw do
  resources :keywords
  resources :advertisements do
    collection do
      match 'click_through/:id' => "advertisements#click_through", :as => :click_through
			match 'get_ad/:id/:size/:div' => 'advertisements#get_ad', :as => :get_ad
    end
  end

  root :to => "advertisements#index"

end
