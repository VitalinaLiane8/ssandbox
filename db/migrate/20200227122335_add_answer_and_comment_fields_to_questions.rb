class AddAnswerAndCommentFieldsToQuestions < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :answer, :string
    add_column :questions, :comment, :string
  end
end
