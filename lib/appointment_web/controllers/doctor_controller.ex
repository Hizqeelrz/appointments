defmodule AppointmentWeb.DoctorController do
  use AppointmentWeb, :controller

  alias Appointment.Appointments
  alias Appointment.Appointments.Doctor

  action_fallback AppointmentWeb.FallbackController

  def index(conn, _params) do
    doctors = Appointments.list_doctors()
    render(conn, "index.json", doctors: doctors)
  end

  def create(conn, %{"doctor" => doctor_params}) do
    IO.inspect "=================="
    IO.inspect doctor_params
    with {:ok, %Doctor{} = doctor} <- Appointments.create_doctor(doctor_params) do
      IO.inspect doctor
      IO.inspect "++++++++++++++++++++"
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.doctor_path(conn, :show, doctor))
      |> render("show.json", doctor: doctor)
    end
  end

  def show(conn, %{"id" => id}) do
    doctor = Appointments.get_doctor!(id)
    render(conn, "show.json", doctor: doctor)
  end

  def update(conn, %{"id" => id, "doctor" => doctor_params}) do
    doctor = Appointments.get_doctor!(id)

    with {:ok, %Doctor{} = doctor} <- Appointments.update_doctor(doctor, doctor_params) do
      render(conn, "show.json", doctor: doctor)
    end
  end

  def delete(conn, %{"id" => id}) do
    doctor = Appointments.get_doctor!(id)

    with {:ok, %Doctor{}} <- Appointments.delete_doctor(doctor) do
      send_resp(conn, :no_content, "")
    end
  end
end
