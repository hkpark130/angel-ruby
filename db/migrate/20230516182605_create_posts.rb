class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|

      t.timestamps
      t.text :title
      t.text :body
      t.string :writer
    end
  end
end
