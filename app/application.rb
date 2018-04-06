class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_name = req.path.split("/items/").last
      binding.pry
    else
      resp.status = 404
    end

    resp.finish
  end

end
