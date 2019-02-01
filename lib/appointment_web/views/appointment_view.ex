defmodule AppointmentWeb.AppointmentView do
  use AppointmentWeb, :view
  alias AppointmentWeb.AppointmentView

  def render("index.json", %{appointments: appointments}) do
    %{data: render_many(appointments, AppointmentView, "appointment.json")}
  end

  def render("show.json", %{appointment: appointment}) do
    %{data: render_one(appointment, AppointmentView, "appointment.json")}
  end

  def render("appointment.json", %{appointment: appointment}) do
    %{id: appointment.id,
      description: appointment.description,
      start_time: appointment.start_time,
      end_time: appointment.end_time,
      date: appointment.date,
      patient_id: appointment.patient_id,
      doctor_id: appointment.doctor_id}
  end
end
