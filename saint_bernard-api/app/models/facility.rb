class Facility < ApplicationRecord
  # callbacks
  before_create :generate_uuid
  
  # associations
  has_many :patients
  
  private
    def generate_uuid
      self.uuid = SecureRandom.uuid
    end
end
