class Session
  include MongoMapper::Document
  key :user, String
  
  many :therapies
  many :contourings
  many :patient_visits
  
  timestamps!
end