# frozen_string_literal: true

Rails.application.routes.draw do
  
  devise_for :users
  resources :audits  
  
  resources  :checklists do
    resource :audit
    
    get :switch_publishing_status, on: :member        
    
    get   :add_audit_fields,       on: :member
    patch :update_audit_fields,    on: :member    
  end  

  root  'checklists#index'
  get '*path', to: 'checklists#index'  
  
end
