Shopping::Engine.routes.draw do
  jsonapi_resources :carts, except: [:index, :destroy] do
    jsonapi_related_resources :line_items
  end
  jsonapi_resources :line_items, except: :index do
  end
end
