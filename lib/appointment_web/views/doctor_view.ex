defmodule AppointmentWeb.DoctorView do
  use AppointmentWeb, :view
  alias AppointmentWeb.DoctorView

  def render("index.json", %{doctors: doctors}) do
    %{data: render_many(doctors, DoctorView, "doctor.json")}
  end

  def render("show.json", %{doctor: doctor}) do
    %{data: render_one(doctor, DoctorView, "doctor.json")}
  end

  def render("doctor.json", %{doctor: doctor}) do
    %{id: doctor.id,
      name: doctor.name,
      email: doctor.email,
      qualification: doctor.qualification,
      speciality: doctor.speciality,
      gender: doctor.gender,
      age: doctor.age}
  end
end
