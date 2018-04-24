require 'rails_helper'
require 'rspec_api_documentation/dsl'
require 'support/rspec_api_documentation'
require 'helpers/authentication_helpers'

resource 'Cart', type: :acceptance do
  before do
    header 'Content-Type', 'application/vnd.api+json'
  end

  let(:cart) { create(:cart) }
  let(:item) { create(:item) }
  let(:id) { cart.id }
  let!(:line_item) { create(:line_item, cart_id: cart.id, source: item, quantity: 1, sale_price: item.price) }

  get '/carts/:id' do
    parameter :cart_id, 'Cart ID', required: true

    let(:expected) {
      {"data"=>
        {"id"=>"#{cart.id}",
         "type"=>"carts",
         "links"=>{"self"=>"http://example.org/carts/#{cart.id}"},
         "attributes"=>
          {"user_id"=>cart.user_id,
           "purchased_at"=>nil,
           "created_at"=> cart.created_at.as_json,
           "updated_at"=> cart.updated_at.as_json,
           "origin" => nil},
        "relationships"=>{
            "line_items" =>
              { "links" => {
                "self" => "http://example.org/carts/#{cart.id}/relationships/line_items",
                "related"=>"http://example.org/carts/#{cart.id}/line_items"
                }
              },
            "cart_purchases" =>
              { "links" => {
                "self" => "http://example.org/carts/#{cart.id}/relationships/cart_purchases",
                "related"=>"http://example.org/carts/#{cart.id}/cart_purchases"
              }
            }
          }}}
    }

    example 'Show (with logged in cart owner)' do
      log_in_user(cart.user_id)
      do_request
      expect(status).to be 200
      expect(response_json).to eq(expected.deep_symbolize_keys)
    end
  end

  get '/carts/:id?include=line_items' do
    parameter :cart_id, 'Cart ID', required: true

    let(:expected) {
      {"data"=>
        {"id"=>"#{cart.id}",
         "type"=>"carts",
         "links"=>{"self"=>"http://example.org/carts/#{cart.id}"},
         "attributes"=>
          {"user_id"=>cart.user_id,
           "purchased_at"=>nil,
           "created_at"=> cart.created_at.as_json,
           "updated_at"=> cart.updated_at.as_json,
           "origin" => nil},
         "relationships"=>
          {"line_items"=>
            {"links"=>
              {"self"=>"http://example.org/carts/#{cart.id}/relationships/line_items",
               "related"=>"http://example.org/carts/#{cart.id}/line_items"},
             "data"=>[{"type"=>"line_items", "id"=>"#{line_item.id}"}]},
            "cart_purchases" =>
              { "links" => {
                "self" => "http://example.org/carts/#{cart.id}/relationships/cart_purchases",
                "related"=>"http://example.org/carts/#{cart.id}/cart_purchases"
              }
            }}},
       "included"=>
        [{"id"=>"#{line_item.id}",
          "type"=>"line_items",
          "links"=>{"self"=>"http://example.org/line_items/#{line_item.id}"},
          "attributes"=>
           {"cart_id"=>cart.id,
            "sale_price"=>"5.0",
            "list_price"=>"5.0",
            "quantity"=>1,
            "created_at"=> line_item.created_at.as_json,
            "updated_at"=> line_item.updated_at.as_json,
            "source_name"=> "An Item",
            "source_id" => line_item.source_id,
            "source_type" => line_item.source_type,
            "source_sku" => line_item.source.sku,
            "options"=>{}},
          "relationships"=>
           {
            "cart"=>
             {"links"=>
               {"self"=>"http://example.org/line_items/#{line_item.id}/relationships/cart",
                "related"=>"http://example.org/line_items/#{line_item.id}/cart"}}}}]}
    }

    example 'Show including line items (with logged in cart owner)', :run do
      log_in_user(cart.user_id)
      do_request

      expect(status).to eq 200
      expect(response_json).to eq(expected.deep_symbolize_keys)
    end
  end


  get '/carts/:id', document: false do

    let(:id) { 9999 }

    example 'Missing' do
      do_request

      expected = {
        :errors => [
          {
            title:  'Record not found',
            detail: 'The record identified by 9999 could not be found.',
            code: '404',
            status: '404',
          }
        ]
      }

      expect(status).to be 404
      expect(response_json).to eq(expected)
    end
  end

  get '/carts?filter[state]=purchased', document: true do
    parameter :state, 'State', required: true

    example 'with a logged in user with purchased carts' do
      cart.purchased_at = Time.zone.now
      cart.save
      cart2 = create(:cart, user_id: cart.user_id)
      expected_response = {:data=>
        [{:id=>"#{cart.id}",
          :type=>"carts",
          :links=>{:self=>"http://example.org/carts/#{cart.id}"},
          :attributes=>
           {:user_id=>cart.user_id,
            :purchased_at=>cart.purchased_at.as_json,
            :created_at=>cart.created_at.as_json,
            :updated_at=>cart.updated_at.as_json,
            :origin=>nil},
          :relationships=>
           {:line_items=>
             {:links=>
               {:self=>"http://example.org/carts/#{cart.id}/relationships/line_items",
                :related=>"http://example.org/carts/#{cart.id}/line_items"}},
            :cart_purchases=>
             {:links=>
               {:self=>"http://example.org/carts/#{cart.id}/relationships/cart_purchases",
                :related=>"http://example.org/carts/#{cart.id}/cart_purchases"}}}}]}

      log_in_user(cart.user_id)
      do_request

      expect(status).to be 200
      expect(response_json).to eq(expected_response)
    end

    example 'with a logged out user' do
      do_request
      expect(status).to be(403)
    end

  end

  get '/carts?filter[state]=failed', document: true do
    parameter :state, 'State', required: true

    example 'with a logged in user with failed carts' do
      cart.failed_at = Time.zone.now
      cart.save
      cart2 = create(:cart, user_id: cart.user_id, failed_at: Time.zone.now, purchased_at: Time.zone.now)

      expected_response = {:data=>
        [{:id=>"#{cart.id}",
          :type=>"carts",
          :links=>{:self=>"http://example.org/carts/#{cart.id}"},
          :attributes=>
           {:user_id=>cart.user_id,
            :purchased_at=>nil,
            :created_at=>cart.created_at.as_json,
            :updated_at=>cart.updated_at.as_json,
            :origin=>nil},
          :relationships=>
           {:line_items=>
             {:links=>
               {:self=>"http://example.org/carts/#{cart.id}/relationships/line_items",
                :related=>"http://example.org/carts/#{cart.id}/line_items"}},
            :cart_purchases=>
             {:links=>
               {:self=>"http://example.org/carts/#{cart.id}/relationships/cart_purchases",
                :related=>"http://example.org/carts/#{cart.id}/cart_purchases"}}}}]}

      log_in_user(cart.user_id)
      do_request

      expect(status).to be 200
      expect(response_json).to eq(expected_response)
    end

    example 'with a logged out user' do
      do_request
      expect(status).to be(403)
    end

  end

  get '/carts?filter[state]=open', document: true do
    parameter :state, 'State', required: true

    example 'with a logged in user with open carts' do
      cart2 = create(:cart, user_id: cart.user_id, failed_at: Time.zone.now, purchased_at: Time.zone.now)

      expected_response = {:data=>
        [{:id=>"#{cart.id}",
          :type=>"carts",
          :links=>{:self=>"http://example.org/carts/#{cart.id}"},
          :attributes=>
           {:user_id=>cart.user_id,
            :purchased_at=>nil,
            :created_at=>cart.created_at.as_json,
            :updated_at=>cart.updated_at.as_json,
            :origin=>nil},
          :relationships=>
           {:line_items=>
             {:links=>
               {:self=>"http://example.org/carts/#{cart.id}/relationships/line_items",
                :related=>"http://example.org/carts/#{cart.id}/line_items"}},
            :cart_purchases=>
             {:links=>
               {:self=>"http://example.org/carts/#{cart.id}/relationships/cart_purchases",
                :related=>"http://example.org/carts/#{cart.id}/cart_purchases"}}}}]}

      log_in_user(cart.user_id)
      do_request

      expect(status).to be 200
      expect(response_json).to eq(expected_response)
    end

    example 'with a logged out user' do
      do_request
      expect(status).to be(403)
    end

  end

  get '/carts?filter[state]=canceled', document: true do
    parameter :state, 'State', required: true

    example 'with a logged in user with canceled carts' do
      cart2 = create(:cart, user_id: cart.user_id, purchased_at: Time.zone.now)
      create(:cart_purchase, cart_id: cart.id, succeeded_at: Time.zone.now, canceled_at: Time.zone.now)
      cart.purchased_at = Time.zone.now
      cart.save

      expected_response = {:data=>
        [{:id=>"#{cart.id}",
          :type=>"carts",
          :links=>{:self=>"http://example.org/carts/#{cart.id}"},
          :attributes=>
           {:user_id=>cart.user_id,
            :purchased_at=>cart.purchased_at.as_json,
            :created_at=>cart.created_at.as_json,
            :updated_at=>cart.updated_at.as_json,
            :origin=>nil},
          :relationships=>
           {:line_items=>
             {:links=>
               {:self=>"http://example.org/carts/#{cart.id}/relationships/line_items",
                :related=>"http://example.org/carts/#{cart.id}/line_items"}},
            :cart_purchases=>
             {:links=>
               {:self=>"http://example.org/carts/#{cart.id}/relationships/cart_purchases",
                :related=>"http://example.org/carts/#{cart.id}/cart_purchases"}}}}]}

      log_in_user(cart.user_id)
      do_request

      expect(status).to be 200
      expect(response_json).to eq(expected_response)
    end

    example 'with a logged out user' do
      do_request
      expect(status).to be(403)
    end

  end

  get '/carts?filter[origin]=:origin', document: true do
    parameter :origin, 'Origin', required: true
    let(:origin){ 'origin' }

    example 'logged in user with existing carts with matching origin' do
      cart.origin = origin
      cart.save
      cart2 = create(:cart, origin: origin, user_id: cart.user_id, created_at: 1.hour.from_now )
      expected_response = {:data=>
        [{:id=>cart2.id.to_s,
          :type=>"carts",
          :links=>{:self=>"http://example.org/carts/#{cart2.id}"},
          :attributes=>
           {:user_id=>cart2.user_id,
            :purchased_at=>nil,
            :created_at=>cart2.created_at.as_json,
            :updated_at=>cart2.updated_at.as_json,
            :origin=>"origin"},
          :relationships=>
           {:line_items=>
             {:links=>
               {:self=>"http://example.org/carts/#{cart2.id}/relationships/line_items",
                :related=>"http://example.org/carts/#{cart2.id}/line_items"}},
            :cart_purchases=>
             {:links=>
               {:self=>"http://example.org/carts/#{cart2.id}/relationships/cart_purchases",
                :related=>"http://example.org/carts/#{cart2.id}/cart_purchases"}}}},
         {:id=>cart.id.to_s,
          :type=>"carts",
          :links=>{:self=>"http://example.org/carts/#{cart.id}"},
          :attributes=>
           {:user_id=>cart.user_id,
            :purchased_at=>nil,
            :created_at=>cart.created_at.as_json,
            :updated_at=>cart.updated_at.as_json,
            :origin=>"origin"},
          :relationships=>
           {:line_items=>
             {:links=>
               {:self=>"http://example.org/carts/#{cart.id}/relationships/line_items",
                :related=>"http://example.org/carts/#{cart.id}/line_items"}},
            :cart_purchases=>
             {:links=>
               {:self=>"http://example.org/carts/#{cart.id}/relationships/cart_purchases",
                :related=>"http://example.org/carts/#{cart.id}/cart_purchases"}}}}]}
      log_in_user(cart.user_id)

      do_request

      expect(status).to be(200)
      expect(response_json).to eq(expected_response)
    end

    example 'logged out user' do
      do_request

      expect(status).to be(403)
    end
  end

  get '/carts?filter[user_id]=:user_id', document: true do
    parameter :user_id, 'User ID', required: true
    let(:user_id){ cart.user_id }

    example 'logged in user with matching user_id' do
      expected_response = {:data=>
        [{:id=> cart.id.to_s,
          :type=>"carts",
          :links=>{:self=>"http://example.org/carts/#{cart.id}"},
          :attributes=>
           {:user_id=>cart.user_id,
            :purchased_at=>nil,
            :created_at=> cart.created_at.as_json,
            :updated_at=> cart.created_at.as_json,
            :origin=>nil},
          :relationships=>
           {:line_items=>
             {:links=>
               {:self=>"http://example.org/carts/#{cart.id}/relationships/line_items",
                :related=>"http://example.org/carts/#{cart.id}/line_items"}},
            :cart_purchases=>
             {:links=>
               {:self=>"http://example.org/carts/#{cart.id}/relationships/cart_purchases",
                :related=>"http://example.org/carts/#{cart.id}/cart_purchases"}}}}]}

      log_in_user(cart.user_id)
      do_request

      expect(status).to be 200
      expect(response_json).to eq(expected_response)
    end

    example 'logged in user with mismatched user_id' do
      expected_error = {:errors=>[{:title=>"Index Forbidden", :detail=>"You don't have permission to index this shopping/cart.", :code=>"403", :status=>"403"}]}

      log_in_user(cart.user_id + 1)
      do_request

      expect(status).to be 403
      expect(response_json).to eq(expected_error)
    end

    example 'logged out user' do
      expected_error = {:errors=>[{:title=>"Index Forbidden", :detail=>"You don't have permission to index this shopping/cart.", :code=>"403", :status=>"403"}]}

      do_request

      expect(status).to be 403
      expect(response_json).to eq(expected_error)
    end
  end

  get '/carts?filter[origin]=add_to_box&include=line_items&filter[user_id]=:user_id', document: true do
    
    parameter :user_id, 'User ID', required: true
    let(:user_id){ cart.user_id }

    example 'muliple users logged with with user filter param' do 
      cart2 = create(:cart, user_id: cart.user_id, origin: 'add_to_box')
      cart3 = create(:cart, user_id: cart.user_id + 1, origin: 'add_to_box')

      expected_response = {:data=>
        [{:id=> cart2.id.to_s,
          :type=>"carts",
          :links=>{:self=>"http://example.org/carts/#{cart2.id}"},
          :attributes=>
           {:user_id=>cart.user_id,
            :purchased_at=>nil,
            :created_at=> cart2.created_at.as_json,
            :updated_at=> cart2.created_at.as_json,
            :origin=>cart2.origin},
          :relationships=>
           {:line_items=>
             {:links=>
               {:self=>"http://example.org/carts/#{cart2.id}/relationships/line_items",
                :related=>"http://example.org/carts/#{cart2.id}/line_items"},
                :data=>[]},
            :cart_purchases=>
             {:links=>
               {:self=>"http://example.org/carts/#{cart2.id}/relationships/cart_purchases",
                :related=>"http://example.org/carts/#{cart2.id}/cart_purchases"}}}}]}

      log_in_user(cart.user_id)
      do_request

      expect(status).to be 200
      expect(response_json).to eq(expected_response)
    end
  end

  get '/carts?filter[origin]=add_to_box&include=line_items', document: true do
    
    let(:user_id){ cart.user_id }

    example 'muliple users logged without user filter parameter' do 
      cart2 = create(:cart, user_id: cart.user_id, origin: 'add_to_box')
      cart3 = create(:cart, user_id: cart.user_id + 1, origin: 'add_to_box')

      expected_response = {:data=>
        [{:id=> cart2.id.to_s,
          :type=>"carts",
          :links=>{:self=>"http://example.org/carts/#{cart2.id}"},
          :attributes=>
           {:user_id=>cart.user_id,
            :purchased_at=>nil,
            :created_at=> cart2.created_at.as_json,
            :updated_at=> cart2.created_at.as_json,
            :origin=>cart2.origin},
          :relationships=>
           {:line_items=>
             {:links=>
               {:self=>"http://example.org/carts/#{cart2.id}/relationships/line_items",
                :related=>"http://example.org/carts/#{cart2.id}/line_items"},
                :data=>[]},
            :cart_purchases=>
             {:links=>
               {:self=>"http://example.org/carts/#{cart2.id}/relationships/cart_purchases",
                :related=>"http://example.org/carts/#{cart2.id}/cart_purchases"}}}}]}

      log_in_user(cart.user_id)
      do_request

      expect(status).to be 200
      expect(response_json).to eq(expected_response)
    end
  end

  context 'forbidden' do
    let(:expected) {
      {"errors"=>
        [{"title"=>"Show Forbidden",
          "detail"=>"You don't have permission to show this shopping/cart.",
          "code"=>"403",
          "status"=>"403"}]}.deep_symbolize_keys
    }

    get '/carts/:id' do
      parameter :cart_id, 'Cart ID', required: true

      example 'logged in user is not owner of cart' do
        do_request
        expect(status).to be 403
        expect(response_json).to eq(expected)
      end
    end

    get '/carts/:id' do
      parameter :cart_id, 'Cart ID', required: true

      example 'no logged in user and cart is owned' do
        do_request
        expect(status).to be 403
        expect(response_json).to eq(expected)
      end
    end
  end

  post '/carts' do
    parameter :origin, 'Origin', required: true, scope: [:data, :attributes]
    parameter :user_id, 'User ID', scope: [:data, :attributes]

    example 'Create with user and origin with logged in user' do
      params = {
        data: {
          type: 'carts',
          attributes: { origin: 'text', user_id: 1 }
        }
      }
      log_in_user(1)

      do_request params

      cart = Shopping::Cart.first
      expected_response = {
        data: {
          id: cart.id.to_s,
          type: "carts",
          links: { self: "http://example.org/carts/#{cart.id}" },
          attributes: {
            user_id: 1,
            purchased_at: nil,
            created_at: "#{cart.created_at.as_json}",
            updated_at: "#{cart.updated_at.as_json}",
            origin: "text"
          },
          relationships: {
            line_items: {
              links: {
                self: "http://example.org/carts/#{cart.id}/relationships/line_items",
                related: "http://example.org/carts/#{cart.id}/line_items"
              }
            },
            cart_purchases: {
              links: {
                self: "http://example.org/carts/#{cart.id}/relationships/cart_purchases",
                related: "http://example.org/carts/#{cart.id}/cart_purchases"
              }
            }
          }
        }
      }

      expect(status).to be 201
      expect(response_json).to eq(expected_response)
    end

    example 'Create without user_id because there is no logged in user' do
      params = { data: { type: 'carts', attributes: { origin: 'text' } } }

      do_request params

      expect(status).to eq(201), "expected 201, got #{status} (#{response_body})"
      expect(response_json[:data][:type]).to eq("carts")
      expect(response_json[:data][:attributes][:user_id]).to be_nil
      expect(response_json[:data][:attributes][:origin]).to eq("text")
    end

    example 'Create with user_id without logged in user' do
      params = {
        data: {
          type: 'carts',
          attributes: { origin: 'text', user_id: 1 }
        }
      }
      expected = {
        :errors=> [{
          title: "Create Forbidden",
          detail: "You don't have permission to create this shopping/cart.",
          code: "403",
          status: "403"
        }]
      }

      do_request params

      expect(status).to be 403
      expect(response_json).to eq(expected)
    end
  end

  patch '/carts/:id' do
    parameter :id, required: true

    let(:cart) { create(:cart, user_id: nil) }
    let(:id) { cart.id }
    let(:params){
      {data:
        {
          id: cart.id,
          type: 'carts',
          attributes: {
            user_id: 1
          }
        }
      }
    }

    let(:expected){
      {"data"=>
        {"id"=>"#{Shopping::Cart.last.id}",
         "type"=>"carts",
         "links"=>{"self"=>"http://example.org/carts/#{Shopping::Cart.last.id}"},
         "attributes"=>
          {"user_id"=>1,
           "purchased_at"=>nil,
           "created_at"=>"#{Shopping::Cart.last.created_at.as_json}",
           "updated_at"=>"#{Shopping::Cart.last.updated_at.as_json}",
           "origin"=>nil
           },
         "relationships"=>
          {"line_items"=>
            {"links"=>
              {"self"=>"http://example.org/carts/#{Shopping::Cart.last.id}/relationships/line_items",
               "related"=>"http://example.org/carts/#{Shopping::Cart.last.id}/line_items"}},
           "cart_purchases"=>
            {"links"=>
              {"self"=>"http://example.org/carts/#{Shopping::Cart.last.id}/relationships/cart_purchases",
               "related"=>"http://example.org/carts/#{Shopping::Cart.last.id}/cart_purchases"}
        }}}}.deep_symbolize_keys
    }

    example 'Update user id of unowned cart with no logged in user' do
      expected =
        {:errors=>
          [{:title=>"Update Forbidden",
            :detail=>"You don't have permission to update this shopping/cart.",
            :code=>"403",
            :status=>"403"}]}

      do_request params
      expect(status).to be 403
      expect(response_json).to eq(expected)
    end

    example 'Update owned cart with logged in owner' do
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
            :detail=>"You don't have permission to update this shopping/cart.",
            :code=>"403",
            :status=>"403"}]}
      end

      example 'Update owned cart with logged in non-owner' do
        cart.update!(user_id: 1)
        log_in_user(2)
        do_request params
        expect(status).to be 403
        expect(response_json).to eq(expected.deep_symbolize_keys)
      end

      example 'Update owned cart with no logged in user' do
        cart.update!(user_id: 1)
        do_request params
        expect(status).to be 403
        expect(response_json).to eq(expected.deep_symbolize_keys)
      end
    end
  end
end
