class RemoveEstimatedBudgetFromProjects < ActiveRecord::Migration
  def change
    remove_column :projects, :estimated_budget, :string
    add_column :projects, :price_cents, :integer, default: 0
  end
end
