class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|

      t.timestamps
      t.string :firstName
      t.string :lastName
      t.string :email
      t.string :password
      t.string :country
    end
  end
end
