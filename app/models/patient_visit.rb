class PatientVisit
  include MongoMapper::Document
  key :session_id, String, :required=>true
  key :chapter_id, String, :required=>true
  many :choices, :class_name => "DialogueChoice"
  timestamps!
end

class DialogueChoice
   include MongoMapper::EmbeddedDocument
   key :choice, String, :required=>true
   key :when, Time, :required=>true
   
   belongs_to :patient_visit
end