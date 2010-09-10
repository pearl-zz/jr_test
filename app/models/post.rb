class Post < ActiveRecord::Base
  
  belongs_to :account
  has_many :comments
  
  jr_model :fields => [:message]
  jr_include_association :comments, :when => :second_order
  jr_include_association :account, :when => :passive
  
end
