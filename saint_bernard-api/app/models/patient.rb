class Patient < ApplicationRecord
  enum gender: [:male,:female,:other]

  # callbacks
  before_create :generate_uuid

  # associations
  belongs_to :admission, required: false
  belongs_to :facility, required: false
  has_many :allergies
  has_many :chronic_conditions, class_name: 'Diagnosis', primary_key: 'id', foreign_key: 'patient_id'
  has_many :medications, class_name: 'MedicationOrder', primary_key: 'id', foreign_key: 'patient_id'
  has_many :diagnostic_procedures
  has_many :diagnoses
  has_many :treatments

  private
    def generate_uuid
      self.uuid = SecureRandom.uuid
    end
end
