class AddIsCriticToProject < ActiveRecord::Migration
  def change
    add_column :projects, :is_critical,  :boolean, default: false
  end
end
