class AddSkipValidationToQuestions < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :skip_validation, :boolean, default: false
  end
end
