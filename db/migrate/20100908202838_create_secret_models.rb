class CreateSecretModels < ActiveRecord::Migration
  def self.up
    create_table :secret_models do |t|
      t.references :account 
      t.string :message
      t.timestamps
    end
  end

  def self.down
    drop_table :secret_models
  end
end
