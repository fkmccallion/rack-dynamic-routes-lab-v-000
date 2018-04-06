class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_name = req.path.split("/items/").last
      price = @@items.select {|item| item.name == item_name}
      binding.pry
    else
      resp.status = 404
      resp.write "Route not found"
    end

    resp.finish
  end

end
