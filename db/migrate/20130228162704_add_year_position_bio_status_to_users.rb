class AddYearPositionBioStatusToUsers < ActiveRecord::Migration
  def change
		add_column :users, :year, :string
		add_column :users, :position, :string
		add_column :users, :bio, :string
		add_column :users, :status, :string
  end
end
