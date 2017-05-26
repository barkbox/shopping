Shopping::Engine.routes.draw do
  jsonapi_resources :carts, except: [:index, :destroy]
  jsonapi_resources :line_items, only: :show do
  end
end
