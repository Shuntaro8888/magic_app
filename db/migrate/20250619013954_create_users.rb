class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t| # This line creates a new table called 'users' create_table is a method provided by ActiveRecord to create a new table in the database.
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
