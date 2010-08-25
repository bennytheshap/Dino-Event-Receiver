require 'randomly_sharded_mongomapper_document'

class BeamChange
  include MongoMapper::Document  
  plugin RandomShardPlugin
  
  validate :something_must_have_changed
  
  key :therapy_id, ObjectId, :required=>true
  
  key :beam, String, :required=>true
  
  #at least one of the following three is required
  key :theta, Numeric
  key :y, Numeric
  key :arc, Numeric

  key :when, Time, :required=>true
  
  belongs_to :therapy
  
  timestamps!
    
  private 
    def something_must_have_changed
      errors.add(:base, "At least one of theta, y, and arc must be present") unless (@theta != nil or @y != nil or @arc != nil)
    end
end