class CreatePayments < ActiveRecord::Migration[6.1]
  def change
    create_table :payments do |t|
      t.belongs_to :movie, null: false, foreign_key: true
      t.string :api_response_code
      t.string :api_response_body

      t.timestamps
    end
  end
end
