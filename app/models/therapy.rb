require 'randomly_sharded_mongomapper_document'

class Therapy
  include MongoMapper::Document
  plugin RandomShardPlugin
  
  key :session_id, ObjectId, :required=>true
  key :chapter_id, String, :required=>true
  
  key :accuracy, Numeric
  key :damage, Numeric
  
  key :started_at, Time, :required=>true 
  
  many :beam_changes

  belongs_to :session
end