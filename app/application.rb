class Application
  def call(env)
    [200, {'Content-Type' => 'text/html'}, ["Application"]]
    # [200, {}, []]
  end
end