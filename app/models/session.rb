require 'randomly_sharded_mongomapper_document'

class Session
  include MongoMapper::Document
  plugin RandomShardPlugin
  
  key :user, String
  
  many :therapies
  many :contourings
  many :patient_visits
  
  timestamps!
end