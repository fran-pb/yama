class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :email, null: false, index: true
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :token, null: false, index: true
      t.boolean :is_admin, null: false, default: false

      t.timestamps
    end
  end
end
