class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :user.id
      t.integer :article.id
      t.text :text
      t.timestamps
    end
  end
end
