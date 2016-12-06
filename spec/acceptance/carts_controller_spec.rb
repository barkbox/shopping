require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Cart', type: :acceptance do

  get '/api/v1/carts/:id' do
    parameter :cart_id, 'Cart id', requred: true

    let(:cart) { create(:cart) }
    let(:id) { cart.id }

    example 'Show' do
      do_request

      expected = ActiveModelSerializers::SerializableResource.new(cart).to_json # request specs should not test the serializer

      expect(status).to be 200
      expect(response_body).to eq(expected)
    end
  end

  get '/api/v1/carts/:id?include=line_items' do
    parameter :cart_id, 'Cart id', requred: true

    let(:cart) { create(:cart) }
    let(:id) { cart.id }

    example 'Show' do
      do_request

      expected = ActiveModelSerializers::SerializableResource.new(cart, include: 'line_items').to_json # request specs should not test the serializer

      p expected

      expect(status).to be 200
      expect(response_body).to eq(expected)
    end
  end


  get '/api/v1/carts/:id', document: false do

    let(:id) { 9999 }

    example 'Missing' do
      do_request

      expect(status).to be 404
    end
  end
end
