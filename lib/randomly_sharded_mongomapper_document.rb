module RandomShardPlugin
  
  module ClassMethods
    def randomly_shard!
      key :_random_shard, Integer
      class_eval { before_create :generate_random_shard_number}
    end
  end
  
  module InstanceMethods
    def generate_random_shard_number
      self[:_random_shard] = rand(16633)
    end
  end 
  
  def self.configure(model)
      model.randomly_shard!
  end
   
end

