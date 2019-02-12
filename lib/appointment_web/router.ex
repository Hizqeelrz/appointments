defmodule AppointmentWeb.Router do
  use AppointmentWeb, :router

  alias Appointment.Guardian

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :jwt_authenticated do
    plug Guardian.AuthPipeline
  end

  scope "/api", AppointmentWeb do
    pipe_through :api

    resources "/doctors", DoctorController, except: [:new, :edit]
    resources "/patients", PatientController, except: [:new, :edit]
    resources "/appointments", AppointmentController, except: [:new, :edit]

    # resources "/users", UserController, only: [:create, :show, :index]

    post "/sign_up", UserController, :create
    post "/sign_in", UserController, :sign_in
  end

  scope "/api", AppointmentWeb do
    pipe_through [:api, :jwt_authenticated]

    get "/my_user", UserController, :show
  end
end
