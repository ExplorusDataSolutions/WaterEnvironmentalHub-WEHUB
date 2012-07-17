class VocabulatorSpeciation < ActiveRecord::Base

  def as_json(options={})
    json = { 
      :name => self.name, :description => self.description                        
    } 
  end

end
