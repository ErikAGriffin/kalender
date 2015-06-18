require 'sequel'

Sequel.migration do
  up do
    create_table(:patients) do
      Integer :id, primary_key: true
      String :first_name, size: 30
      String :last_name, size: 30
    end
  end

  down do
    drop_table(:patients)
  end
end
