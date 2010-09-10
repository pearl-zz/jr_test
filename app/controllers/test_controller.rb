class TestController < ApplicationController
  
  caches_page :poller
  
  # The main test page
  def index
    p `rake db:fixtures:load`
    @bob = Account.find_by_id(1)
  end
  
  # A helper for the polling tasks. Simulates other polling clients
  def poller
    @bob = Account.find_by_id(1)
  end
  
  
  
  
  # Helper: resets data and returns bob's (as first order) bundle 
  def reset_bob
    p `rake db:fixtures:load`
    render :json => Account.find(1).jr_bundle.to_json
  end
  
  # Helper method to change models server-side
  def update
    model_name = params[:model_name]
    model_id = params[:id]
    field_name = params[:field_name]
    value = params[:value]
    
    m = model_name.classify.constantize
    i = m.find(model_id)
    i.__send__ :update_attribute, field_name, value
    
    render :text => ''
  end
  

  # Gets a value from the DB
  def get
    model_name = params[:model_name]
    model_id = params[:id]
    field_name = params[:field_name]
    
    m = model_name.classify.constantize
    i = m.find(model_id)
    v = i.__send__ field_name.to_sym
    
    render :text => v
  end
  
  
end
