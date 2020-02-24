# frozen_string_literal: true

# Controller for user sees the list of checklists
class ChecklistsController < ApplicationController
  before_action :set_checklist, only: [:show, :destroy]

  def index
    @checklists = Checklist.page(params[:page]).per(10)
  end
  
  def show; end  

  def new
    @checklist = Checklist.new
  end
  
  def create
    @checklist = Checklist.new(checklist_params)

    if @checklist.save
      redirect_to @checklist, notice: 'Checklist was successfully created.' 
    else
      render :new 
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
      params.require(:checklist).permit(:title, :description)
    end    
end
