module DiagnosisHelper

  def self.filter(object)
    object_tmp = object
    object     = object.attributes
    object['created_at']  = object_tmp.created_at.strftime("%d %b, %Y %I:%M%p")
    object['updated_at']  = object_tmp.created_at.strftime("%d %b, %Y %I:%M%p")
    return object
  end

end