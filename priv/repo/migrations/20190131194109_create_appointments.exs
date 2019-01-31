defmodule Appointment.Repo.Migrations.CreateAppointments do
  use Ecto.Migration

  def change do
    create table(:appointments) do
      add :description, :string
      add :start_time, :time
      add :end_time, :time
      add :date, :date
      add :patient_id, references(:patients, on_delete: :delete_all), null: false
      add :doctor_id, references(:doctors, on_delete: :delete_all), null: false

      timestamps()
    end

    create index(:appointments, [:patient_id])
    create index(:appointments, [:doctor_id])
  end
end
