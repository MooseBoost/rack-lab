require 'erb'

class ErbMaker
  def initialize(app)
    @app = app
  end
  
  def call(env)
    request = Rack::Request.new(env)
    if request.path.match(/about/)
      path = File.expand_path("lib/templates/about.html.erb")
      render = ERB.new(File.read(path)).result(binding)
      Rack::Response.new(render)
    else
      port = env['SERVER_PORT']
      request_method = env['REQUEST_METHOD']

      path = File.expand_path("lib/templates/main.html.erb")
      render = ERB.new(File.read(path)).result(binding)
      Rack::Response.new(render) 
    end
  end
end