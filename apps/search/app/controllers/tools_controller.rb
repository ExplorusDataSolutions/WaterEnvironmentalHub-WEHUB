class ToolsController < ApplicationController

  respond_to :json, :xml
  
  def test
    render :layout => false
  end
  
  def index
    @breadcrumb = ['Tools']
    @main_menu = 'we_tools'
  end
  
  def chart
    @breadcrumb = ['Tools', 'Graph']
    @main_menu = 'we_tools'

    if params[:id]
      params[:ids] = [params[:id]]
    end
    
    @datasets = catalogue_instance.api_datasets(params)
  end
  
  def chart_feature
    result = catalogue_instance.api_feature(params)
    
    property = nil
    values = []
    result.features.each_with_index do |feature, i|
      if i == 0
        property = feature.properties.keys[0]
      end
      values.push(Float(feature.properties[property]))
    end

    respond_with(values)
  end
  
  def table
    @breadcrumb = ['Tools', 'Data Graph']
    @main_menu = 'we_tools'
  end
  
  def map
    @breadcrumb = ['Tools', 'Map']
    @main_menu = 'we_tools'
    
    if params[:id]
      params[:ids] = [params[:id]]
    end
    @datasets = catalogue_instance.api_datasets(params)
  end
  
  def developers
    redirect_to :controller => 'api' and return
    
    @id = params[:id]
    @breadcrumb = ['Tools', 'Developers']
    @main_menu = 'we_tools'
  end
  
  def add_new_dataset
    @id = params[:hid_last_cnt]
    render :layout => false
  end
  
  def add_new_dataset_map
    @id = params[:hid_last_cnt]
    render :layout => false
  end

  def parse_json
    f = File.read('public/lat1.json')
    @json = f.strip
    yaxis=params[:yaxis]
    xaxis=params[:xaxis]
    xaxis=URI.unescape(xaxis)
    yaxis=URI.unescape(yaxis)
    xaxis=xaxis.gsub /\+/, " "
    @rangex= Array.new
    @rangey= Array.new
    @value= Array.new
    @value_hash=Hash.new
    @rangex=Array.new
    @rangey=Array.new
     @value_lonlat=Array.new
    j=0
    @data= JSON.parse(@json)
    @data.each do |var|
        @value_lonlat << [var['Latitude'].to_f,  var['Longitude'].to_f]
    end
    @value_lonlat.uniq!
    @j=0
    @value_lonlat.each do |var|
     @value_hash[@j]=''
     @j+=1
    end
    latitude= @data[0]['Latitude']
    longitude=@data[0]['Longitude']
    @j=0
    @value_lonlat.each do |var_outer|
        latitude=var_outer[0].to_f
        longitude=var_outer[1].to_f

        @data.each do |var_inner|
            if !var_inner[xaxis].nil? && !var_inner[yaxis].nil?
             if var_inner[xaxis].length >0 && var_inner[yaxis].length >0
                if var_inner['Latitude'].to_f==latitude&&var_inner['Longitude'].to_f==longitude                    
                    yval=var_inner[yaxis].to_f
                    xval=var_inner[xaxis].to_f
                    @value << [xval, yval]
                    @rangex.push(var_inner[xaxis].to_f)
                    @rangey.push(var_inner[yaxis].to_f)
                end
             end
         end
        end
        @value_hash[@j]=@value.sort
        @value_hash["#{@j}_x"]=@rangex.minmax
        @value_hash["#{@j}_y"]=@rangey.minmax
        
        @value.clear
        @rangex.clear
        @rangey.clear
        @j+=1 
    end
     @value_hash["len"]=@j
     
     @x_set=Array.new
     @y_set=Array.new
     for i in 0..@j-1
       @x_set=@x_set|@value_hash["#{i}_x"]
       @y_set=@y_set|@value_hash["#{i}_y"]
     end
     @value_hash["x_set"]=@x_set.minmax
     @value_hash["y_set"]=@y_set.minmax
    render :text =>@value_hash.to_json and return   
  end

end
