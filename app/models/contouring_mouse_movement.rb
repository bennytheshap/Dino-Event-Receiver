class ContouringMouseMovement
  include MongoMapper::Document  
  plugin RandomShardPlugin
  
  key :contouring_id, ObjectId, :required=>true
  belongs_to :contouring
  
  key :slice_id, Numeric, :required=>true
  key :when, Time, :required=>true
  
  #x, y, and radius should be within the (unscaled) plane of the source image
  key :radius, Numeric, :required=>true
  
  key :is_colored, Boolean, :required => true  #true if marking, false if erasing
  # 
  many :points
end

class Point
  include MongoMapper::EmbeddedDocument
  
  belongs_to :contouring_mouse_movement
  
  key :x, Numeric, :required=>true
  key :y, Numeric, :required=>true
end