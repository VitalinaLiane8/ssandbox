class AddPublishedStatusesToChecklists < ActiveRecord::Migration[5.2]
  def change
    add_column :checklists, :published, :boolean, default: false
    add_column :checklists, :next_publish_status, :string, default: 'Publish'
  end
end
