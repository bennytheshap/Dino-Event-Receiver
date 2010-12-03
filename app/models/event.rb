require 'randomly_sharded_mongomapper_document'

class Event
  include MongoMapper::Document
  plugin RandomShardPlugin
  
  key :session_id, ObjectId, :required=>true
  key :time, Numeric, :required=>true
  key :event_name, String, :required=>true
  
  belongs_to :session
end

