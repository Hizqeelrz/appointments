defmodule Appointment.Appointments.Doctor do
  use Ecto.Schema
  import Ecto.Changeset


  schema "doctors" do
    field :age, :integer
    field :email, :string
    field :gender, :string
    field :name, :string
    field :qualification, :string
    field :speciality, :string

    timestamps()
  end

  @doc false
  def changeset(doctor, attrs) do
    doctor
    |> cast(attrs, [:name, :email, :qualification, :speciality, :gender, :age])
    |> validate_required([:name, :email, :qualification, :speciality, :gender, :age])
  end
end
