Shopping::Engine.routes.draw do
  resources :carts, except: [:index, :destroy]
  resources :line_items
end
