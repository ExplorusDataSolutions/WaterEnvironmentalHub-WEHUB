module UuidHelper

  def is_uuid(uuid)
    if !uuid
      false
    else
      uuid.match(/[\w]{8}-[\w]{4}-[\w]{4}-[\w]{4}-[\w]{12}/) ? true : false
    end
  end
  
end
