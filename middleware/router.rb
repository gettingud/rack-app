class Router
  def initialize(app)
    @app = app
  end

  def call(env)
    request = Rack::Request.new(env)
    if request.path == '/time'
      status, headers, body = @app.call(env)
    else
      status, headers, body = error_404
    end
    [status, headers, body]
  end

  private

  def error_404
    [status, headers, body]
  end

  def status
    404
  end

  def headers
    { 'Content-Type' => 'text/plain' }
  end

  def body
    ['']
  end
end
