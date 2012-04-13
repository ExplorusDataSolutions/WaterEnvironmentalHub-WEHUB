class CsvBuilderPostgreSQL
  
  attr_accessor :csv_directory  
  
  include DatabaseHelper
  
  def initialize(csv_directory='tmp/csvs')
    @csv_directory = csv_directory
  end
  
  def data(feature, params)    
    filename = "#{csv_directory}/#{feature.filename}.csv"
    tablename = feature.tablename

    query = ''    
    if params['page']
      start = params['page']['start'].to_i
      size = params['page']['size'].to_i
      if start > 0
        start = start * size
      end

      column = nil
      direction = nil
      if params['sort']
        column = params['sort']['by']
        direction = params['sort']['direction']
      end
      direction = (direction && direction.casecmp('DESC') != -1) ? 'DESC' : 'ASC'
      
      order_by = ''
      if column      
        order_by = "ORDER BY CASE WHEN \"#{column}\" ~ '^[0-9]+$' THEN lpad(\"#{column}\", 100, '0') ELSE \"#{column}\" END #{direction}" 
        query = ActiveRecord::Base.send(:sanitize_sql_array, ["(SELECT * FROM \"#{tablename}\" #{order_by} OFFSET ? LIMIT ?)", start, size])
        query.gsub!('order_by', order_by)
      else
        query = ActiveRecord::Base.send(:sanitize_sql_array, ["(SELECT * FROM \"#{tablename}\" OFFSET ? LIMIT ?)", start, size])      
      end
      
      filename = "#{csv_directory}/#{feature.filename}_#{start}_#{size}_#{column}_#{direction}.csv"
    else
      query = tablename
    end

    begin
      if !File.exist?(filename)
        %x[touch #{filename}] 
        %x[chmod o+w #{filename}] 

        execute("COPY #{query} TO '#{filename}' WITH CSV HEADER")

        %x[chmod o-w #{filename}]
      end

      IO.read(filename)
    rescue Exception => e
      raise ArgumentError, "Csv for #{feature.tablename} could not be generated"
    end
  end

  def extension
    'csv'
  end

end
