defmodule Appointment.Repo do
  use Ecto.Repo,
    otp_app: :appointment,
    adapter: Ecto.Adapters.Postgres
end
