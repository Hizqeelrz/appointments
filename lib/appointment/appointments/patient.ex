defmodule Appointment.Appointments.Patient do
  use Ecto.Schema
  import Ecto.Changeset


  schema "patients" do
    field :address, :string
    field :age, :integer
    field :city, :string
    field :email, :string
    field :firstname, :string
    field :gender, :string
    field :lastname, :string
    field :phone, :integer
    field :state, :string

    timestamps()
  end

  @doc false
  def changeset(patient, attrs) do
    patient
    |> cast(attrs, [:firstname, :lastname, :age, :email, :gender, :address, :city, :state, :phone])
    |> validate_required([:firstname, :lastname, :age, :email, :gender, :address, :city, :state, :phone])
  end
end
