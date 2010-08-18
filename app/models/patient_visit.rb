class PatientVisit
  include MongoMapper::EmbeddedDocument
  key :session_id, ObjectId, :required=>true
  key :chapter_id, String, :required=>true
  many :choices, :class_name => "DialogueChoice"
  
  belongs_to :session
  
  timestamps!
end

class DialogueChoice
   include MongoMapper::EmbeddedDocument
   key :choice, String, :required=>true
   key :when, Time, :required=>true
   
   belongs_to :patient_visit
end