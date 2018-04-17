Shopping::Engine.routes.draw do
  jsonapi_resources :carts, except: [:destroy] do 
    jsonapi_resources :line_items do
    	
    end
    jsonapi_related_resources :cart_purchases
  end
  jsonapi_resources :line_items, except: :index do
  end
  jsonapi_resources :cart_purchases, only: [:create, :show] do
  end
end
