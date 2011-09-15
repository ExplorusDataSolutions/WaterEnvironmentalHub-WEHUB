class TemporalExtentTranslator
  attr_accessor :temporal_extent, :feature_period
  
  def initialize(feature_period)
    @feature_period = feature_period
  end
  
  def temporal_extent
    extent_start, extent_end = nil
    if feature_period
      feature_period.strip!
      
      if !feature_period.scan(/ - /).empty?
        if !feature_period.scan(/unknown/i).empty?
          if feature_period.index(/unknown/i) == 0
            extent_end = translate(feature_period.split(/ - /)[1])
          else
            extent_start = translate(feature_period.split(/ - /)[0])
          end
        else
          extent_start = translate(feature_period.split(/ - /)[0])
          extent_end = translate(feature_period.split(/ - /)[1])
        end
      else
        extent_start = translate(feature_period)
      end
      if (extent_start || extent_end)    
        { :begin => extent_start, :end => extent_end }
      end
    end
  end
  
  private
  
  def translate(date)

    begin
      result = Time.parse(date)
      result.iso8601.split('T')[0]
    rescue
      month = nil
      day = nil
      year = nil
      date.strip!
      result = date.match(/([\d]*)\/([\d]*)\/([\d]*)/)
      if result
        if result.captures.length == 3
          two_digit_captures = []
          result.captures.each do |capture|
            if capture.length == 4
              year = capture
            elsif capture.length == 2
              two_digit_captures.push(capture)
            end
          end
          
          if two_digit_captures.length == 2
            day = two_digit_captures[0]
            month = two_digit_captures[1]
          elsif two_digit_captures.length == 1
            day = 1
            month = two_digit_captures[0]
          end
        end
      end
      
      if year.nil?
        result = date.match(/([\d]*)/)
        if result
          year = result[1]
          if !year.empty?
            if day.nil?
              day = 1
            end
            if month.nil?
              month = 1
            end
          end
        end
      end
      
      if year.to_s.length == 2
        year = 2000 + Integer(year)
      end
      
      begin
        Time.parse("#{year}/#{day}/#{month}").iso8601.split('T')[0]
      rescue
      end
    end
  end
  
end

=begin
dates = [' 1989/01/17 - 2009/12/31', '2003', 'unknown - 2002/06/06', '9/2004', '18-Jul-03', ' 18-Jul-03  - 10-Jun-08 ', 'unknown - unknown', '7/31/2007 - 9/8/2008']
dates.each do |date|
  puts TemporalExtentTranslator.new(date).temporal_extent
end
=end

