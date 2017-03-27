class AddMxToDomains < ActiveRecord::Migration
  def change
    add_column :domains, :mx, :string
  end
end
