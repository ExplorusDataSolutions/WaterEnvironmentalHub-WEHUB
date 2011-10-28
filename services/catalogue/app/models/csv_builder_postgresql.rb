class CsvBuilderPostgreSQL
  
  attr_accessor :csv_directory  
  
  def initialize(csv_directory='tmp/csvs')
    @csv_directory = csv_directory
  end
  
  def build(feature)
    filename = "#{csv_directory}/#{feature.filename}.#{extension}"

    begin
      if !File.exist?(filename)
        %x[touch #{filename}] 
        %x[chmod o+w #{filename}] 

        ActiveRecord::Base.connection.execute("COPY #{feature.tablename} TO '#{filename}' WITH CSV HEADER")

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
