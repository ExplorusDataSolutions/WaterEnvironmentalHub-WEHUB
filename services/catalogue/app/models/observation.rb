class Observation < ActiveRecord::Base

  belongs_to :feature

  def as_json(options={})
    json = { :json => self.json }
  end

end
