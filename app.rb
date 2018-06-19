class App
  FORMATS = {
    year: "%Y",
    month: "%m",
    day: "%d",
    hour: "%H",
    minute: "%M",
    second: "%S"
  }

  def call(env)
    @request = Rack::Request.new(env)
    @body = get_date
    [status, headers, body]
  end

  private

  def get_date
    current_time = Time.now
    time_formats.map do |format|
      current_time.strftime(FORMATS[format])
    end.join('-')
  end

  def time_formats
    @request.params['format'].split(',').map(&:to_sym)
  end

  def status
    200
  end

  def headers
    { 'Content-Type' => 'text/plain' }
  end

  def body
    [@body]
  end
end
