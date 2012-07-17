class VocabulatorUnits < ActiveRecord::Base

  def self.inheritance_column()
    'type_override'
   end

  def as_json(options={})    
    json = { 
      :type => self.type, :name => self.name, :description => self.abbreviation 
    }
  end

end
