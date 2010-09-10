class UserController < ApplicationController

  def index
    @account = Account.find(1)
  end
  
end

