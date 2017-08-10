Shopping::Engine.routes.draw do
  jsonapi_resources :carts, except: [:index, :update, :destroy] do
    jsonapi_related_resources :line_items
    jsonapi_related_resources :cart_purchases
  end
  jsonapi_resources :line_items, except: :index do
  end
  jsonapi_resources :cart_purchases, only: :create do
  end
end
