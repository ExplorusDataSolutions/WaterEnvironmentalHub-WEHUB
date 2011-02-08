class DatasetGroup < ActiveRecord::Base
  
  belongs_to :dataset

  def as_json(options={})
    json = { :name => self.name }
  end
  
end
