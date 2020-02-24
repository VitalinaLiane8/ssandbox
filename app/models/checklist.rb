# frozen_string_literal: true

class Checklist < ApplicationRecord

  validates :title,         presence: true, length: { maximum: 40 }
  validates :description,   presence: true

end
