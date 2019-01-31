class Symptom < ApplicationRecord
  # callbacks
  before_create :generate_uuid

  # associations
  belongs_to :admission, required: false
  
  private
    def generate_uuid
      self.uuid = SecureRandom.uuid
    end
end
