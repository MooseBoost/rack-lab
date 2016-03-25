class RandomNumber
  def initialize(app)
    @app = app
  end
  
  def call(env)
    status, header, body = @app.call(env) unless @app.nil?
    new_r = rand(1000)
    
    [status, header, ["#{new_r}"]]
  end
end