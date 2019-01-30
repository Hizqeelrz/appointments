defmodule AppointmentWeb.PatientView do
  use AppointmentWeb, :view
  alias AppointmentWeb.PatientView

  def render("index.json", %{patients: patients}) do
    %{data: render_many(patients, PatientView, "patient.json")}
  end

  def render("show.json", %{patient: patient}) do
    %{data: render_one(patient, PatientView, "patient.json")}
  end

  def render("patient.json", %{patient: patient}) do
    %{id: patient.id,
      firstname: patient.firstname,
      lastname: patient.lastname,
      age: patient.age,
      email: patient.email,
      gender: patient.gender,
      address: patient.address,
      city: patient.city,
      state: patient.state,
      phone: patient.phone}
  end
end
