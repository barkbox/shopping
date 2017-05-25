json.set! :cart do
  json.(cart, :id, :user_id, :purchased_at, :created_at)

  if includes.include?('line_items')
    json.line_items cart.line_items, partial: 'shopping/line_items/line_item', as: :line_item
  end
end