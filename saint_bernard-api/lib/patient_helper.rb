module PatientHelper

  def self.filter(object)
    object_tmp = object
    object     = object.attributes
    object['facility']  = object_tmp.facility
    object['admission'] = AdmissionHelper.filter(object_tmp.admission)
    object['allergies'] =  object_tmp.allergies.map{|x| x.description }.to_sentence
    object['chronic_conditions'] =  object_tmp.chronic_conditions.where(coding_system:nil).map{|x| "#{x.description} (#{x.code})" }.to_sentence
    object['medications'] =  object_tmp.medications.map{|x| "#{x.name} #{x.dosage}#{x.unit} #{x.route} #{x.frequency.value}#{x.frequency.unit} to #{x.necessity}" }.to_sentence
    object['diagnostic_procedures'] =  object_tmp.diagnostic_procedures.map{|x| "#{x.description} on #{x.moment.strftime("%B %d, %Y")} at #{x.moment.strftime("%H:%M")}" }.to_sentence
    object['diagnoses']      = object_tmp.diagnoses.where.not(coding_system:nil).map{|x| "#{x.description} (#{x.code}.#{x.coding_system})" }.to_sentence
    object['treatments']      = object_tmp.treatments.map{|x| "#{x.description} to #{x.necessity} " }.to_sentence
    object['age']       = ((Time.zone.now - object_tmp.dob.to_time) / 1.year.seconds).floor
    object['created_at']  = object_tmp.created_at.strftime("%d %b, %Y %I:%M%p")
    object['updated_at']  = object_tmp.created_at.strftime("%d %b, %Y %I:%M%p")
    return object
  end

end