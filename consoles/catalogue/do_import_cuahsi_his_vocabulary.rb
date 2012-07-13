require 'savon'
require 'active_support/core_ext'

client = Savon.client("http://his.cuahsi.org/odmcv_1_1/odmcv_1_1.asmx?wsdl")
client.config.log = false

def get_the_soap_content(client, soap_method)
  response = (client.request soap_method.underscore.to_sym).xpath("//body:#{soap_method}Result/text()", 'body' => "http://his.cuahsi.org/his/1.1/ws/").to_s
  response = Nokogiri::XML(REXML::Text::unnormalize(response)).xpath('//Records').to_xml
  response = Hash.from_xml(response)['Records']['Record']
  response
end

def post_json(uri, hash)
  puts "Updating Catalogue"
  timeout = 500
  url = URI.parse(uri)
  http = Net::HTTP.new(url.host, url.port)
  http.read_timeout = timeout
  http.open_timeout = timeout
  
  response = http.start {|http| http.post(url.to_s, hash.to_json, { 'Content-Type' => 'application/json'}) }

  case response
  when Net::HTTPSuccess, Net::HTTPRedirection
  else
    puts hash
    puts response.body
    response.error!
  end
      
  if response.body.strip.empty?
    puts "Failure, record for #{uri} was not updated"
  else 
    puts "Success, record for #{uri} updated"
  end
end

def rename_for_catalogue(hash)
  JSON.parse(hash.to_json.gsub('Term','name').gsub('Definition','description'))
end

sample_types = get_the_soap_content(client, 'GetSampleTypeCV')

sample_types = rename_for_catalogue(sample_types)
puts sample_types

post_json('http://localhost:3000/vocabulator/sample_types', { :sample_types => sample_types })
#puts get_the_soap_content(client, 'GetVariableNameCV')
#puts Hash.from_xml(response)['GetUnitsResponse']['Records']['Record']
#puts Hash.from(response)['

