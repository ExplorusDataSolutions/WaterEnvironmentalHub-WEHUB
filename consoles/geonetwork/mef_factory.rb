require 'net/http'
require 'zip/zip'
require 'active_support/core_ext'

class MefFactory
  attr_accessor :server_address, :temp_directory, :timeout
  
  def initialize(temp_directory="#{Dir.getwd}/tmp/mefs", server_address='localhost:3000', timeout=300)
    @server_address = server_address
    @temp_directory = temp_directory
    @timeout = timeout
  end
  
  def metadata(uuid)
    http_get("http://#{server_address}/geonetwork/metadata/#{uuid}.xml")
  end
  
  def info(uuid)
    http_get("http://#{server_address}/geonetwork/info/#{uuid}.xml")
  end
  
  def filepath(uuid)
    "#{temp_directory}/#{filename(uuid)}"
  end
  
  def filename(uuid)
    "#{uuid}.mef"
  end
  
  def build(uuid)
    puts "\nBuilding Mef file for #{uuid}"
    begin    
      files = {}
      files.store('metadata.xml', metadata(uuid))
      files.store('info.xml', info(uuid))
      
      directories = ['private', 'public']
      
      Zip::ZipFile.open(filepath(uuid), Zip::ZipFile::CREATE) do |zip|
        files.each do |key, value|
          zip.get_output_stream("#{key}") { |f| f.puts value }  
        end
        directories.each do |directory|
          if !zip.find_entry(directory)
            zip.mkdir(directory)
          end
        end
      end
      
      return { :status => 'Successful', :uuid => uuid }
    rescue
      return { :status => 'Failed', :uuid => uuid }
    end
  end
  
  def build_all
    uuid_list = Hash.from_xml(http_get("http://#{server_address}/geonetwork/mef-import-list.xml"))['strings']
    puts "#{uuid_list.count} Mef files will be created"
    
    errors = {}
    uuid_list.each do |uuid|
      result = build(uuid)

      if !errors[result[:status]]
        errors[result[:status]] = [] 
      end
      errors[result[:status]].push(result[:uuid])
    end
    
    puts "-------"
    puts "Mef build summary"
    puts "\tTotal records: #{uuid_list.count}"
    errors.each do |key, value|    
      puts "\t#{key} records: #{errors[key].count}"
      if key == 'Failed'
        puts "\t#{key} record ids: #{errors[key].join(',')}"
      end
    end
    puts "-------"
  end
  
  def http_get(uri)
    puts "\tGetting #{uri}"
    url = URI.parse(uri)    
    http = Net::HTTP.new(url.host, url.port)
    http.read_timeout = timeout
    http.open_timeout = timeout
    response = http.start {|http| http.get(url.to_s) }
    
    case response
    when Net::HTTPSuccess, Net::HTTPRedirection
    else
      puts "\tFailure, #{uri} could not be retrieved"
      response.error!
    end

    response.body
  end
end
