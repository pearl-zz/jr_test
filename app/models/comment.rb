class Comment < ActiveRecord::Base
  
  belongs_to :account
  belongs_to :post
  
  jr_model :fields => [:message]
  jr_include_association :post, :when => :always
  jr_include_association :account, :when => :always
  
end
