class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_name = req.path.split("/items/").last
      
      item = @@items.select {|item| item.name == item_name}.first
      resp.write item.price
      binding.pry
    else
      resp.status = 404
      resp.write "Route not found"
    end

    resp.finish
  end

end
