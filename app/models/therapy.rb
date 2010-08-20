class Therapy
  include MongoMapper::EmbeddedDocument
  
  key :session_id, ObjectId, :required=>true
  key :chapter_id, String, :required=>true
  
  key :accuracy, Numeric, :required=>true
  key :damage, Numeric, :required=>true
  
  key :when, Time, :required=>true

  belongs_to :session
end