require 'randomly_sharded_mongomapper_document'

class PatientVisit
  include MongoMapper::Document
  plugin RandomShardPlugin
  
  #key :session_id, ObjectId, :required=>true
  key :chapter_id, String, :required=>true
  many :choices, :class_name => "DialogueChoice"
  
  key :started_at, Time, :required=>true  
  
  belongs_to :session
end

class DialogueChoice
   include MongoMapper::EmbeddedDocument
   key :choice, String, :required=>true
   key :when, Time, :required=>true
   
   belongs_to :patient_visit
end