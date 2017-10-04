module AcceptanceHelpers

  def with_exception(exn)
    Shopping.config.purchase_cart_service_class.throw_error(exn)
    yield
    Shopping.config.purchase_cart_service_class.throw_error(nil)
  end

  def response_json
    JSON.parse(response_body, symbolize_names: true)
  end

end