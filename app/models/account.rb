class Account < ActiveRecord::Base
  
  has_many :posts
  has_many :comments
  has_many :secret_models
  
  jr_model :fields => [:name, :login, :email]
  jr_include_association :posts, :when => :first_order
  jr_include_association :comments, :when => :first_order
  
  jr_before_serialize :add_stuff_to_bundle 
  
  def self.add_stuff_to_bundle(outgoing_bundle, incoming_bundle)
    outgoing_bundle[:custom_message] = "Hi Mom!"
  end
  
  
end
