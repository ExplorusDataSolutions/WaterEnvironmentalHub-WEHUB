class DatasetGroup < ActiveRecord::Base
  
  has_and_belongs_to_many :datasets

  def as_json(options={})
    related_datasets = []
    self.datasets.each do |d|
      if options[:exclude] and options[:exclude] != d.uuid
        related_datasets.push({ :uuid => d.uuid, :name => d.name, :description => d.description })
      end
    end

    json = { :name => self.name, :datasets => related_datasets }
  end
  
end
