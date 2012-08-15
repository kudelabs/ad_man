AdMan::Engine.routes.draw do
  resources :keywords
  resources :advertisements do
    collection do
      match 'click_through/:id' => "advertisements#click_through", :as => :click_through
			match '/advertisements/get_ad/:id' => 'advertisements#get_ad'
    end
  end

  root :to => "advertisements#index"

end
