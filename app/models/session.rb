class Session
  include MongoMapper::Document
  key :session_id, String
  key :user, String
  timestamps!
end