class RequestMethod
  def initialize(app=nil)
    @app = app
  end
  
  def call(env)
    request = Rack::Request.new(env)
    status, header, body = @app.call(env) unless @app.nil?
    old_r = body[0]
    new_r = request.request_method 
    
    [status, header, ["#{old_r} \n #{new_r}"]]
  end
end