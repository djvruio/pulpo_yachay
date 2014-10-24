class AddColumnstateToTasks < ActiveRecord::Migration
  def change
    #remove_column :tasks, :status
  	#add_column :tasks, :state_id, :integer
  	add_column :tasks, :value, :integer
  end
end
