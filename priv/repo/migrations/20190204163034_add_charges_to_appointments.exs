defmodule Appointment.Repo.Migrations.AddChargesToAppointments do
  use Ecto.Migration

  def change do
    alter table(:appointments) do
      add :charges, :integer
    end
  end
end
