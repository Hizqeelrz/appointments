defmodule Appointment.Appointments.Appointment do
  use Ecto.Schema
  import Ecto.Changeset

  alias Appointment.Appointments.{Patient, Doctor}

  schema "appointments" do
    field :date, :date
    field :description, :string
    field :end_time, :time
    field :start_time, :time

    belongs_to :patient, Patient
    belongs_to :doctor, Doctor


    timestamps()
  end

  @doc false
  def changeset(appointment, attrs) do
    appointment
    |> cast(attrs, [:description, :date, :start_time, :end_time, :patient_id, :doctor_id])
    |> validate_required([:description, :date, :start_time, :end_time, :patient_id, :doctor_id])
  end
end
