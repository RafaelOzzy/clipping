class AddFieldsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :name, :string
    add_column :users, :cnpj, :string
    add_column :users, :company, :string
  end
end
