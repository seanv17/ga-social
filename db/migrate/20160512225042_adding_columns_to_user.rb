class AddingColumnsToUser < ActiveRecord::Migration
  def change
    add_column :users, :current_employer, :string
    add_column :users, :tech_preference, :string
  end
end
