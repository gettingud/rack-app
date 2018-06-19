class ParamsChecker
  PARAMS = %w[year month day hour minute second]

  def initialize(app)
    @app = app
  end

  def call(env)
    @request = Rack::Request.new(env)
    if invalid_params.empty?
      status, headers, body = @app.call(env)
    else
      status, headers, body = error_400
    end
    [status, headers, body]
  end

  private

  def error_400
    [status, headers, body]
  end

  def status
    400
  end

  def headers
    { 'Content-Type' => 'text/plain' }
  end

  def body
    "Unknown time format [#{invalid_params.map(&:to_s).join(', ')}]"
  end

  def invalid_params
    time_formats - PARAMS
  end

  def time_formats
    @request.params['format'].split(',')
  end
end
