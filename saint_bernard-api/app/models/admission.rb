class Admission < ApplicationRecord
  # callbacks
  before_create :generate_uuid
  
  # associations
  has_many :observations
  has_many :diagnoses
  has_many :symptoms
  belongs_to :patient, required: false
  
  private
    def generate_uuid
      self.uuid = SecureRandom.uuid
    end
end
