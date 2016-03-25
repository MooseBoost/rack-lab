class ServerPort
  def initialize(app=nil)
    @app = app
  end

  def call(env)
    status, header, body = @app.call(env) unless @app.nil?
    old_r = body[0]
    new_r = "Port: #{env['SERVER_PORT']}"
    
    [status, header, ["#{old_r}: \n #{new_r}"]]
  end
end