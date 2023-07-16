class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string  :first_name
      t.string  :last_name
      t.string  :email_address
      t.string  :designation
      t.integer  :dept_id
      t.timestamps
    end

    create_table :departments do |t|
      t.string :dept_name
    end

    create_table :bils do |t|
      t.bigint :amount
      t.string :type
      t.bigint :employee_id
      t.timestamps
    end
  end
end
