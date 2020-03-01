# frozen_string_literal: true

class Question < ApplicationRecord

  belongs_to :checklist, optional: true
  has_one    :answer,    dependent: :destroy

  validates :title,         presence: true, length: { minimum: 12, maximum: 40 }
  validates :description,   presence: true    
  
end
