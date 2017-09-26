Shopping::Engine.routes.draw do
  jsonapi_resources :carts, except: [:index, :destroy] do
    jsonapi_related_resources :line_items
    jsonapi_related_resources :cart_purchases
  end
  jsonapi_resources :line_items, except: :index do
  end
  jsonapi_resources :cart_purchases, only: [:create, :show, :update] do
    # TODO how to limit to just PATCH?
  end
end
