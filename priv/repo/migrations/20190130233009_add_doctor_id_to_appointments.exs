defmodule Appointment.Repo.Migrations.AddDoctorIdToAppointments do
  use Ecto.Migration

  def change do
    alter table(:appointments) do
      add :doctor_id, references(:doctors, on_delete: :delete_all), null: false
    end

    create index(:appointments, [:doctor_id])
  end
end
