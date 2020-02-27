# frozen_string_literal: true

Rails.application.routes.draw do
  
  resources :audits  
  
  resources  :checklists do
    resource :audit
  end  

end
