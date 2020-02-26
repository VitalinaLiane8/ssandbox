# frozen_string_literal: true

Rails.application.routes.draw do
  
  resources :checklists
  resources :audits
  
end
