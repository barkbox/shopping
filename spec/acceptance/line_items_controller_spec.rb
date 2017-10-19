require 'rails_helper'
require 'rspec_api_documentation/dsl'
require 'pry'
require 'support/rspec_api_documentation'

resource 'LineItem', type: :acceptance do
  before do
    header 'Content-Type', 'application/vnd.api+json'
  end

  get '/line_items/:id' do
    parameter :id, required: true

    let(:cart) { create(:cart, user_id: nil) }
    let(:item) { create(:item) }
    let(:line_item) { create(:line_item, source_id: item.id, source_type: 'Item', cart_id: cart.id) }
    let(:id) { line_item.id }
    let(:expected){
      {"data"=>
        {"id"=>"#{id}",
         "type"=>"line_items",
         "links"=>{"self"=>"http://example.org/line_items/#{id}"},
         "attributes"=>
          {"cart_id"=> line_item.cart_id,
           "sale_price"=>"5.0",
           "list_price"=>"5.0",
           "quantity"=>1,
           "created_at"=> line_item.created_at.as_json,
           "updated_at"=> line_item.updated_at.as_json,
           "source_id"=> item.id,
           "source_type"=>"Item",
           "source_sku"=>"IMASKU",
           "options"=>{}},
         "relationships"=>
          {"cart"=>
            {"links"=>
              {"self"=>"http://example.org/line_items/#{id}/relationships/cart",
               "related"=>"http://example.org/line_items/#{id}/cart"}
        }}}}.deep_symbolize_keys
    }

    example 'Find with an unowned cart' do
      do_request
      expect(status).to eq(200)
      expect(response_json).to eq(expected)
    end

    example 'Find with an owned cart and logged in owner' do
      cart.update!(user_id: 1)
      log_in_user(cart.user_id)
      do_request
      expect(status).to eq(200)
      expect(response_json).to eq(expected)
    end

    example 'Find with an owned cart and no logged in user' do
      expected = {:errors=>
        [{:title=>"Show Forbidden",
          :detail=>"You don't have permission to show this shopping/line item.",
          :code=>"403",
          :status=>"403"}]}
      cart.update!(user_id: 1)
      do_request
      expect(status).to eq(403)
      expect(response_json).to eq(expected)
    end

    example 'Find with an owned cart and logged in non-owner' do
      expected = {:errors=>
        [{:title=>"Show Forbidden",
          :detail=>"You don't have permission to show this shopping/line item.",
          :code=>"403",
          :status=>"403"}]}
      cart.update!(user_id: 1)
      log_in_user(2)
      do_request
      expect(status).to eq(403)
      expect(response_json).to eq(expected)
    end
  end

  post '/line_items' do
    parameter :cart_id, scope: [:data, :attributes], required: true
    parameter :source_id, scope: [:data, :attributes], required: true
    parameter :source_type, scope: [:data, :attributes], required: true
    parameter :sale_price, scope: [:data, :attributes], required: true
    parameter :list_price, scope: [:data, :attributes], required: true

    let(:cart) { create(:cart, user_id: nil) }
    let(:cart_id) { cart.id }
    let(:item) { create(:item) }
    let(:expected){
      li = Shopping::LineItem.first
      {"data"=>
        {"id"=>"#{li.id}",
         "type"=>"line_items",
         "links"=>{"self"=>"http://example.org/line_items/#{li.id}"},
         "attributes"=>
          {"cart_id"=> cart_id,
           "sale_price"=>"1.0",
           "list_price"=>"1.0",
           "quantity"=>nil,
           "created_at"=> li.created_at.as_json,
           "updated_at"=> li.updated_at.as_json,
           "source_id"=> item.id,
           "source_type"=>"Item",
           "source_sku"=>"IMASKU",
           "options"=>{}},
         "relationships"=>
          {"cart"=>
            {"links"=>
              {"self"=>"http://example.org/line_items/#{li.id}/relationships/cart",
               "related"=>"http://example.org/line_items/#{li.id}/cart"}
        }}}}.deep_symbolize_keys
    }

    example 'Create with an unowned cart' do
      params = {
        data:{
          type: "line_items",
          attributes: {
            cart_id: cart.id,
            source_id: item.id,
            source_type: item.class.name,
            sale_price: 1.0,
            list_price: 1.0
          }
        }
      }

      do_request params
      expect(status).to eq(201)
      expect(response_json).to eq(expected)
    end

    example 'Create with an owned cart and logged in owner' do
      params = {
        data:{
          type: "line_items",
          attributes: {
            cart_id: cart.id,
            source_id: item.id,
            source_type: item.class.name,
            sale_price: 1.0,
            list_price: 1.0
          }
        }
      }
      cart.update(user_id: 1)
      log_in_user(1)
      do_request params
      expect(status).to eq(201), "expected 201, got #{status}: #{response_json}"
      expect(response_json).to eq(expected)
    end

    example 'Create with a club plan' do
      cart = create(:cart)
      params = {
        data: {
          type: "line_items",
          attributes: {
            cart_id: cart.id,
            source_id: item.id,
            source_type: item.class.name,
            options: {
              club: "extra-toy"
            }
          }
        }
      }
      club_source = create(:item)
      existing_source = double(:existing_source)
      plan_class = double(:plan_class, find_club_plan: club_source, find: existing_source)
      Shopping.config.plan_class(plan_class)
      log_in_user(cart.user_id)

      do_request params

      expect(status).to eq(201), "expected 201, got #{status}: #{response_json}"
      expect(response_json[:data][:attributes][:source_id]).to eq(club_source.id)
    end

    context 'forbidden' do
      let(:expected) do
        {"errors"=>
          [{"title"=>"Create Forbidden",
            "detail"=>"You don't have permission to create this shopping/line item.",
            "code"=>"403",
            "status"=>"403"}]}.deep_symbolize_keys
      end

      example 'Create with an owned cart and a different logged in user' do
        params = {
          data:{
            type: "line_items",
            attributes: {
              cart_id: cart.id,
              source_id: item.id,
              source_type: item.class.name,
              sale_price: 1.0,
              list_price: 1.0
            }
          }
        }

        cart.update(user_id: 1)
        log_in_user(2)
        do_request params
        expect(status).to eq(403)
        expect(response_json).to eq(expected)
      end

      example 'Create with an owned cart and no logged in user' do
        params = {
          data:{
            type: "line_items",
            attributes: {
              cart_id: cart.id,
              source_id: item.id,
              source_type: item.class.name,
              sale_price: 1.0,
              list_price: 1.0
            }
          }
        }

        cart.update(user_id: 1)
        do_request params
        expect(status).to eq(403)
        expect(response_json).to eq(expected)
      end
    end
  end

  patch '/line_items/:id' do
    parameter :id, 'Line item id', required: true

    let(:cart) { create(:cart, user_id: nil) }
    let(:cart_id) { cart.id }
    let(:item) { create(:item) }
    let!(:line_item) { create(:line_item, cart_id: cart.id, source: item, quantity: 1, sale_price: item.price) }
    let(:id) { line_item.id }
    let(:expected){
      {"data"=>
        {"id"=>"#{id}",
         "type"=>"line_items",
         "links"=>{"self"=>"http://example.org/line_items/#{id}"},
         "attributes"=>
          {"cart_id"=>cart_id,
           "sale_price"=>"5.0",
           "list_price"=>"5.0",
           "quantity"=>2,
           "created_at"=> line_item.created_at.as_json,
           "updated_at"=> line_item.reload.updated_at.as_json,
           "source_id"=> item.id,
           "source_type"=>"Item",
           "source_sku"=>"IMASKU",
           "options"=>{}},
         "relationships"=>
          {"cart"=>
            {"links"=>
              {"self"=>"http://example.org/line_items/#{id}/relationships/cart",
               "related"=>"http://example.org/line_items/#{id}/cart"}
        }}}}.deep_symbolize_keys
    }

    let(:params) do
      {
        data: {
          id: line_item.id,
          type: "line_items",
          attributes: {
            quantity: 2
          }
        }
      }

    end
    example 'Update with unowned cart' do
      do_request params
      expect(status).to be 200
      expect(response_json).to eq(expected)
    end

    example 'Update with owned cart and logged in owner' do
      cart.update!(user_id: 1)
      log_in_user(cart.user_id)
      do_request params
      expect(status).to be 200
      expect(response_json).to eq(expected)
    end

    context 'forbidden' do
      let(:expected) do
          {:errors=>
            [{:title=>"Update Forbidden",
              :detail=>"You don't have permission to update this shopping/line item.",
              :code=>"403",
              :status=>"403"}]}
      end

      example 'Update with owned cart and logged in non-owner' do
        cart.update!(user_id: 1)
        log_in_user(2)
        do_request params
        expect(status).to be 403
        expect(response_json).to eq(expected)
      end

      example 'Update with owned cart and no logged in user' do
        cart.update!(user_id: 1)
        do_request params
        expect(status).to be 403
        expect(response_json).to eq(expected)
      end
    end
  end

  delete '/line_items/:id' do
    parameter :line_item_id, 'Line item id', required: true

    let(:cart) { create(:cart) }
    let(:cart_id) { cart.id }
    let(:item) { create(:item) }
    let!(:line_item) { create(:line_item, cart_id: cart.id, source: item, quantity: 1, sale_price: item.price) }
    let(:id) { line_item.id }

    example 'Delete' do
      expect(Shopping::LineItem.count).to eq(1)
      do_request
      expect(status).to be 204
      expect(Shopping::LineItem.count).to eq(0)
    end
  end
end
