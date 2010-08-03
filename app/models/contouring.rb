class Contouring
  include MongoMapper::Document
  
  key :session_id, ObjectId, :required=>true
  key :chapter_id, String, :required=>true
  key :accuracy_score, Numeric, :required=>true
  key :overlap_score, Numeric, :required=>true
  
  key :image_width, Numeric, :required=>true
  key :image_height, Numeric, :required=>true
  
  key :view_width, Numeric, :required=>true
  key :view_height, Numeric, :required=>true
  
  many :points
  
  timestamps!
end

class Point
  include MongoMapper::EmbeddedDocument
  
  belongs_to :countouring
  
  key :x, Numeric, :required=>true
  key :y, Numeric, :required=>true
  key :radius, Numeric, :required=>true
  key :colored, Boolean, :required=>true #should be false if the point was erased
  key :when, Time, :required=>true  
end