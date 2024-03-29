require 'sequel'

Sequel.migration do
  up do
    create_table(:users) do
      primary_key :id
      String :email, size: 50
      String :password_hash
      Integer :role
    end
  end

  down do
    drop_table(:users)
  end
end
