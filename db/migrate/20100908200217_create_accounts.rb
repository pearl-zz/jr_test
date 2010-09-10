class CreateAccounts < ActiveRecord::Migration
  def self.up
    create_table :accounts do |t|
      t.column :login,                     :string, :limit => 40
      t.column :name,                      :string, :limit => 100, :default => '', :null => true
      t.column :email,                     :string, :limit => 100
      t.column :password,                  :string, :limit => 40
      t.timestamps
    end
  end

  def self.down
    drop_table :accounts
  end
end
