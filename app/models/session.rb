require 'randomly_sharded_mongomapper_document'

class Session
  include MongoMapper::Document
  plugin RandomShardPlugin
  
  many :events
  
  timestamps!
end