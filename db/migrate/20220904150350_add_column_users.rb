class AddColumnUsers < ActiveRecord::Migration[6.0]
  def up
	end
	
  def down
		remove_column :users, :place, :string
  end
end
