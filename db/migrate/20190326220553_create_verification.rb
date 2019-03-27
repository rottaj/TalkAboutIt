class CreateVerification < ActiveRecord::Migration[5.2]
  def change
    	add_column :users, :verification_code, :text, :default => nil
  end
end
