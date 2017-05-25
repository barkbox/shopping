Shopping::Engine.routes.draw do
  jsonapi_resources :carts, except: [:index, :destroy]
  # resources :line_items
end
