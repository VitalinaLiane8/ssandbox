# frozen_string_literal: true

# Controller for user sees the list of audits
class AuditsController < ApplicationController

  before_action :set_checklist,    only: [:new, :create]  
  before_action :set_audit,        only: [:destroy]

  def index
    @audits = Audit.page(params[:page]).per(10)
    @checklists = Checklist.all
  end 
  
  def new    
  end
  
  def create    
    if @checklist.update(checklist_params)
      redirect_to audits_path, notice: 'Audit was successfully created.' 
    else
      render :new 
    end    
  end   

  def destroy
    @audit.destroy
    redirect_to audits_path, notice: 'Audit was successfully destroyed.'
  end
  
  
  private
    def set_audit
      @audit = Audit.find(params[:id])
    end 
    
    def set_checklist
      @checklist = Checklist.find(params[:checklist_id])
    end      
    
    # Only allow a list of trusted parameters through.
    def checklist_params
      params
        .require(:checklist)
        .permit(:title, :description,
          questions_attributes: Question.attribute_names.map(&:to_sym).push(:_destroy))
    end       
            
end  
