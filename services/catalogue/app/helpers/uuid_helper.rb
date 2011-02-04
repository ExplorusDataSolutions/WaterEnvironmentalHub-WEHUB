require 'uuidtools'

module UuidHelper
  def before_create()
    self.uuid = UUID.timestamp_create().to_s
  end
end
