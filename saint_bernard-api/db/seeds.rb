User.create(first_name:Faker::Name.first_name, last_name: Faker::Name.last_name, phone:Faker::PhoneNumber, email: 'staff@admin.com', password:'123456', rol: 'admin')
facility = Facility.create(name:'Blue Alps Ski Camp emergency facility')

24.times.each_with_index do |x,index|
  OrderFrequency.create(value:"q#{index + 1}", unit: 'hour')
end

admission = Admission.create(moment: '2018-02-18 17:05:00')

patient = facility.patients.create(
  first_name:'Thomas', 
  last_name:'Schudel',
  mr: '30997',
  dob: (Time.now - 43.year),
  gender: 0,
  admission_id: admission.id
)

admission.diagnoses.create(description:'a fracture of upper end of the right tibia',code:'S82',coding_system: '101')
admission.symptoms.create(description:'severe pain')
admission.symptoms.create(description:'swelling')
admission.symptoms.create(description:'limited bending of the joint')
admission.observations.create(description:'No soft tissues were damaged',moment: '2018-02-18 17:05:00')


patient.allergies.create(description:'hypersensitivity to aspirin or NSAIDs')
patient.allergies.create(description:'gluten intolerance')
patient.chronic_conditions.create(description:'Asthma',code:'J45')
patient.medications.create(name:'Acetaminophen', dosage: '500', unit:'mg', route: 'PO', necessity: 'relieve pain',frequency_id:4)
patient.medications.create(name:'Naproxen', dosage: '500', unit:'mg', route: 'PO', necessity: 'relieve swelling',frequency_id:6)
patient.diagnostic_procedures.create(description:'an exploratory radiography',moment:'2018-02-18 17:15:00')
patient.diagnoses.create(description:'a closed fracture in the right tibia',code:'S82',coding_system: '101A')
patient.treatments.create(description:'temporary bracing the right leg', necessity:'restrict the motion')