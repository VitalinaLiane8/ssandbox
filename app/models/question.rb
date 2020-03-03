# frozen_string_literal: true

class Question < ApplicationRecord
  
  has_many    :answer,    dependent: :destroy
  belongs_to :checklist, optional: true  
  
  accepts_nested_attributes_for :answer

  validates :title,         presence: true, length: { minimum: 12, maximum: 40 }
  validates :description,   presence: true    
  
end
