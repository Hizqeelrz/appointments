defmodule Appointment.Repo.Migrations.ChangePhoneTypeToStringInPatientTable do
  use Ecto.Migration

  def change do
    alter table(:patients) do
      modify :phone, :string
    end
  end
end
