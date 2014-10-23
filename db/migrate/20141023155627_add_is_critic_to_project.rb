class AddIsCriticToProject < ActiveRecord::Migration
  def change
    add_column :projects, :is_critic, :boolean
  end
end
