class VocabulatorSampleType < ActiveRecord::Base
   
  def as_json(options={})
    json = { 
      :id => self.id, :name => self.name, :description => self.description                        
    } 
  end

end
