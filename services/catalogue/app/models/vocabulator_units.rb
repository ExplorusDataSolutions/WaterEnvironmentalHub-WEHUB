class VocabulatorUnits < ActiveRecord::Base

  def self.inheritance_column()
    'type_override'
   end

end
