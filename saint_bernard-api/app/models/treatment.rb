class Treatment < ApplicationRecord
  # callbacks
  before_create :generate_uuid
  
  private
    def generate_uuid
      self.uuid = SecureRandom.uuid
    end
end
