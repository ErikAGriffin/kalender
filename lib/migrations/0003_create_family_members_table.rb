require 'sequel'

Sequel.migration do
  up do
    create_table(:family_members) do
      foreign_key :user_id, :users, primary_key: true
      String :first_name, size: 30
      String :last_name, size: 30
      foreign_key :patient_id, :patients
    end
  end

  down do
    drop_table(:family_members)
  end
end
