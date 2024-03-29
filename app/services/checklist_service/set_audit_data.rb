# frozen_string_literal: true

# Services: Module ChecklistService and its Class SetAuditData
module ChecklistService
  class SetAuditData < ApplicationService
  
    def initialize(checklist)
      @checklist = checklist
    end   

    def call
      unless @checklist.audit    
        @checklist.build_audit 
      else  
        @checklist.audit.touch
      end  
      @checklist
    end
    
  end
end
