require 'randomly_sharded_mongomapper_document'

class Therapy
  include MongoMapper::Document
  plugin RandomShardPlugin
  
  key :session_id, ObjectId, :required=>true
  key :conversation_id, Numeric, :required=>true
  key :chapter_id, Numeric, :required=>true
  
  key :accuracy_score, Numeric
  key :damage_score, Numeric
  
  key :started_at, Time, :required=>true 
  
  many :beam_changes

  belongs_to :session
end