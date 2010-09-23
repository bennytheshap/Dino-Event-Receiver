require 'randomly_sharded_mongomapper_document'

class Contouring
  include MongoMapper::Document
  plugin RandomShardPlugin
    
  key :session_id, ObjectId, :required=>true
  key :chapter_id, String, :required=>true
  
  key :accuracy_score, Numeric
  key :overlap_score, Numeric
  
  key :image_width, Numeric, :required=>true
  key :image_height, Numeric, :required=>true
  
  key :view_width, Numeric, :required=>true
  key :view_height, Numeric, :required=>true
  
  key :started_at, Time, :required=>true  
  
  many :mouse_movements, :class_name => "ContouringMouseMovement"
    
  belongs_to :session
end

