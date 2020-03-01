class Answer < ApplicationRecord
  belongs_to :question, optional: true
  
  validates :answer,    presence: true   
  validates :comment,   presence: true, length: { minimum: 12 }  
end
