class CreateVerification < ActiveRecord::Migration[5.2]
  def change
    	add_column :users, :verification_code, :string, :default => nil
  end
end
