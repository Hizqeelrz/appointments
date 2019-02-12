defmodule Appointment.Guardian.AuthPipeline do
  use Guardian.Plug.Pipeline, otp_app: :Appointment,
  module: Appointment.Guardian,
  error_handler: Appointment.AuthErrorHandler

  plug Guardian.Plug.VerifyHeader, realm: "Bearer"
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource
end
