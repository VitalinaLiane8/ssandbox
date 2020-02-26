# frozen_string_literal: true

# Controller for user sees the list of audits
class AuditsController < ApplicationController

  def index
    @audits = Audit.page(params[:page]).per(10)
  end 
  
end  
