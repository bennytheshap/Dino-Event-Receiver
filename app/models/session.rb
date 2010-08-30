require 'randomly_sharded_mongomapper_document'

class Session
  include MongoMapper::Document
  plugin RandomShardPlugin
  
  key :user_id, ObjectId
  
  belongs_to :user
  
  many :therapies
  many :contourings
  many :patient_visits
  
  timestamps!
end