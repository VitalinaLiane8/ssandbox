# frozen_string_literal: true

# Controller for user sees the list of audits
class AuditsController < ApplicationController

  before_action :set_checklist, only: [:destroy]

  def index
    @audits = Audit.page(params[:page]).per(10)
  end 
  
  def destroy
    @audit.destroy
    redirect_to audits_url, notice: 'Audit was successfully destroyed.'
  end
  
  
  private
    def set_audit
      @audit = Audit.find(params[:id])
    end 
        
end  
