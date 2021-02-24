class CreateUsers < ActiveRecord::Migration[6.1]
 
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email

      t.timestamps          #default adds created at and updated at info
    end
  end
end
