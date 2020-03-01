# frozen_string_literal: true

class Audit < ApplicationRecord
  belongs_to :checklist
  belongs_to :user, optional: true
end
