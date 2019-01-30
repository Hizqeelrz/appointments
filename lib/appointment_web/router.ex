defmodule AppointmentWeb.Router do
  use AppointmentWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", AppointmentWeb do
    pipe_through :api

    resources "/doctors", DoctorController, except: [:new, :edit]
    resources "/patients", PatientController, except: [:new, :edit]

  end
end
