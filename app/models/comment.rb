class Comment < ActiveRecord::Base
  
  belongs_to :account
  belongs_to :post
  
  jr_model :fields => [:message]
  jr_include_association :post, :when => :passive
  jr_include_association :account, :when => :passive
  
end
