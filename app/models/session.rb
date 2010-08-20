class Session
  include MongoMapper::Document
  plugin RandomShardPlugin
  
  key :user, String
  
  many :therapies
  many :contourings
  many :patient_visits
  
  timestamps!
end