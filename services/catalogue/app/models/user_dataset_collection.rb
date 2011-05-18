class UserDatasetCollection < ActiveRecord::Base

  def as_json(options={})    
    json = { 
      :dataset => { :uuid => self.uuid }
    }
  end

end
