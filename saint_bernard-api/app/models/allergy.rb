class Allergy < ApplicationRecord
  # callbacks
  before_create :generate_uuid
  
  # associations
  belongs_to :patient
  
  private
    def generate_uuid
      self.uuid = SecureRandom.uuid
    end
end
