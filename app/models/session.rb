class Session
  include MongoMapper::Document
  key :user, String
  timestamps!
end