module AdmissionHelper

  def self.filter(object)
    object_tmp = object
    object     = object.attributes
    object['date']  = object_tmp.moment.strftime("%B %d, %Y")
    object['time']  = object_tmp.moment.strftime("%H:%M")
    object['diagnoses']      = object_tmp.diagnoses.map{|x| "#{x.description} (#{x.code}.#{x.coding_system})" }.to_sentence
    object['symptoms']       = object_tmp.symptoms.map{|x| x.description }.to_sentence
    object['observations']   = object_tmp.observations.map{|x| x.description }.to_sentence
    object['created_at']  = object_tmp.created_at.strftime("%d %b, %Y %I:%M%p")
    object['updated_at']  = object_tmp.created_at.strftime("%d %b, %Y %I:%M%p")
    return object
  end

end