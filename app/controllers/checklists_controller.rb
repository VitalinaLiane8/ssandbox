# frozen_string_literal: true

# Controller for user sees the list of checklists
class ChecklistsController < ApplicationController

  def index
    @checklists = Checklist.all
  end

end
