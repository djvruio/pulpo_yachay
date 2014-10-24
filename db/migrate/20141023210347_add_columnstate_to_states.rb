class AddColumnstateToStates < ActiveRecord::Migration
  def change
    add_column :states, :value, :integer
  end
end
