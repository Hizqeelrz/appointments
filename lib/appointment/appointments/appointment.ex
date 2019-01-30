defmodule Appointment.Appointments.Appointment do
  use Ecto.Schema
  import Ecto.Changeset

  alias Appointment.Appointments.Patient

  schema "appointments" do
    field :date, :date
    field :description, :string
    field :end_time, :time
    field :start_time, :time

    belongs_to :patient, Patient


    timestamps()
  end

  @doc false
  def changeset(appointment, attrs) do
    appointment
    |> cast(attrs, [:description, :date, :start_time, :end_time])
    |> validate_required([:description, :date, :start_time, :end_time])
  end
end
