class ApplicationController < ActionController::Base
  before_action :set_variables
  def set_variables
    @customer = Customer.first
    @shop  = Shop.first
  end
end
