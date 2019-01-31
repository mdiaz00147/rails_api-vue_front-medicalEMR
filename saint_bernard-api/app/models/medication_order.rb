class MedicationOrder < ApplicationRecord
  enum unit: [:mg]
  enum route: [:PO, :IM, :SC]
  
  # callbacks
  before_create :generate_uuid

  # associations
  has_one :frequency, class_name: 'OrderFrequency', primary_key: 'frequency_id', foreign_key: 'id'

  private
    def generate_uuid
      self.uuid = SecureRandom.uuid
    end
end
