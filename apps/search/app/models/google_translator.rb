class GoogleTranslator

  attr_accessor :url, :cache
  
  def initialize(url="http://www.google.com", cache={})
    @url = url
    @cache = cache
  end

  def verify_recaptcha(remote_ip, challenge, response)
    #DoTo: move this key into our config
    params = {
      :privatekey => '6Le2xtUSAAAAAOsQwSYgvHv-8rLTBALkYbriQA4P',
      :remoteip => remote_ip, 
      :challenge => challenge,
      :response => response
    }
    
    result = post("#{url}/recaptcha/api/verify", params)
    result.match(/true/)
  end

  def post(uri, params)
    timeout = 500
    url = URI.parse(uri)
    http = Net::HTTP.new(url.host, url.port)
    http.read_timeout = timeout
    http.open_timeout = timeout
    response = http.start {|http| http.post(url.to_s, params.to_query) }

    response.value
    response.body
  end  
  
end
