class StatusController < ApplicationController

  respond_to :json, :xml
  
  caches_action :search, :cache_path => Proc.new { |c| c.params }, :expires_in => 15.minutes
  caches_action :social_network, :cache_path => Proc.new { |c| c.params }, :expires_in => 25.minutes
  caches_action :catalogue, :cache_path => Proc.new { |c| c.params }, :expires_in => 25.minutes

  def search
    search_instance.do_query(random_string, nil, nil, nil)
    
    respond_with({ :status => 'OK', :time => Time.new }, :location => nil) and return
  end

  def social_network
    begin
      socialnetwork_instance.sign_in(random_string, random_string)
      
    rescue => e
      if e.response.code_type == Net::HTTPForbidden
        respond_with({ :status => 'OK', :time => Time.new }, :location => nil) and return
      end
    end
  end
  
  def catalogue
    catalogue_instance.datasets_last_uploaded

    respond_with({ :status => 'OK', :time => Time.new }, :location => nil) and return
  end
  
  private 
  
  def random_string
    (0...18).map{65.+(rand(25)).chr}.join
  end
  
end
