# frozen_string_literal: true

# Controller for user sees the list of checklists
class ChecklistsController < ApplicationController
  before_action :set_checklist, only: [:show, :edit, :update, :add_audit_fields, :update_audit_fields, :destroy]

  def index
    @checklists = Checklist.page(params[:page]).per(10)
  end
  
  def new
    @checklist = Checklist.new
    @checklist.questions.build
  end
  
  def create
    @checklist = Checklist.new(checklist_params)

    if @checklist.save
      redirect_to checklists_url, notice: 'Checklist was successfully created.' 
    else
      render :new 
    end    
  end  
  
  def show; end  
  
  def edit
  end
  
  def update
    if @checklist.update(checklist_params)
      redirect_to @checklist, notice: 'Checklist was successfully updated.'
    else
      render :edit 
    end
  end    
    
  def add_audit_fields    
  end
  
  def update_audit_fields
    title = @checklist.title   
    @checklist = ChecklistService::AuditData.call(@checklist)
    
    if @checklist.update(checklist_params) and @checklist.update(title: title)
      redirect_to audits_path, notice: 'Audit was successfully created.' 
    else
      render :add_audit_fields
    end   
  end
  
  def destroy
    @checklist.destroy
    redirect_to checklists_url, notice: 'Checklist was successfully destroyed.'
  end
    
  
  private
    def set_checklist
      @checklist = Checklist.find(params[:id])
    end  

    # Only allow a list of trusted parameters through.
    def checklist_params
      params
        .require(:checklist)
        .permit(:title, :description,
          questions_attributes: Question.attribute_names.map(&:to_sym).push(:_destroy))
    end        
end
