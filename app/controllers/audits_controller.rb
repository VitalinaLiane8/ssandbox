# frozen_string_literal: true

# Controller for user sees the list of audits
class AuditsController < ApplicationController

  def index
    @audits = Audit.all
  end 
  
end  
