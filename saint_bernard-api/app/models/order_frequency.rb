class OrderFrequency < ApplicationRecord
  enum unit: [:hour]
  
  # callbacks
  before_create :generate_uuid
  
  private
    def generate_uuid
      self.uuid = SecureRandom.uuid
    end
end
