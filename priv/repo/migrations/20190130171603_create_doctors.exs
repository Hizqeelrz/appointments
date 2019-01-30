defmodule Appointment.Repo.Migrations.CreateDoctors do
  use Ecto.Migration

  def change do
    create table(:doctors) do
      add :name, :string
      add :email, :string
      add :qualification, :string
      add :speciality, :string
      add :gender, :string
      add :age, :integer

      timestamps()
    end

  end
end
