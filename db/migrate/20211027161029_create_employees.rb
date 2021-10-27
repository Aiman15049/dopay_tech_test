# frozen_string_literal: true

# migration file for creating employees
class CreateEmployees < ActiveRecord::Migration[6.1]
  def change
    create_table :employees do |t|
      t.string :fullname
      t.integer :identification_number

      t.timestamps
    end
  end
end
