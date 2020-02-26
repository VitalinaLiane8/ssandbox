# frozen_string_literal: true

Rails.application.routes.draw do
  
  resources  :checklists do
    resource :audit
  end  
  
  resources :audits

end
