class Observation < ApplicationRecord
  # callbacks
  before_create :generate_uuid
  
  # associations
  belongs_to :admission
  
  private
    def generate_uuid
      self.uuid = SecureRandom.uuid
    end
end
