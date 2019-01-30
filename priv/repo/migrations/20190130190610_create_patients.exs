defmodule Appointment.Repo.Migrations.CreatePatients do
  use Ecto.Migration

  def change do
    create table(:patients) do
      add :firstname, :string
      add :lastname, :string
      add :age, :integer
      add :email, :string
      add :gender, :string
      add :address, :string
      add :city, :string
      add :state, :string
      add :phone, :integer

      timestamps()
    end

  end
end
