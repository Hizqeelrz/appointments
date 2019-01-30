defmodule AppointmentWeb.PatientControllerTest do
  use AppointmentWeb.ConnCase

  alias Appointment.Appointments
  alias Appointment.Appointments.Patient

  @create_attrs %{
    address: "some address",
    age: 42,
    city: "some city",
    email: "some email",
    firstname: "some firstname",
    gender: "some gender",
    lastname: "some lastname",
    phone: 42,
    state: "some state"
  }
  @update_attrs %{
    address: "some updated address",
    age: 43,
    city: "some updated city",
    email: "some updated email",
    firstname: "some updated firstname",
    gender: "some updated gender",
    lastname: "some updated lastname",
    phone: 43,
    state: "some updated state"
  }
  @invalid_attrs %{address: nil, age: nil, city: nil, email: nil, firstname: nil, gender: nil, lastname: nil, phone: nil, state: nil}

  def fixture(:patient) do
    {:ok, patient} = Appointments.create_patient(@create_attrs)
    patient
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all patients", %{conn: conn} do
      conn = get(conn, Routes.patient_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create patient" do
    test "renders patient when data is valid", %{conn: conn} do
      conn = post(conn, Routes.patient_path(conn, :create), patient: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.patient_path(conn, :show, id))

      assert %{
               "id" => id,
               "address" => "some address",
               "age" => 42,
               "city" => "some city",
               "email" => "some email",
               "firstname" => "some firstname",
               "gender" => "some gender",
               "lastname" => "some lastname",
               "phone" => 42,
               "state" => "some state"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.patient_path(conn, :create), patient: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update patient" do
    setup [:create_patient]

    test "renders patient when data is valid", %{conn: conn, patient: %Patient{id: id} = patient} do
      conn = put(conn, Routes.patient_path(conn, :update, patient), patient: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.patient_path(conn, :show, id))

      assert %{
               "id" => id,
               "address" => "some updated address",
               "age" => 43,
               "city" => "some updated city",
               "email" => "some updated email",
               "firstname" => "some updated firstname",
               "gender" => "some updated gender",
               "lastname" => "some updated lastname",
               "phone" => 43,
               "state" => "some updated state"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, patient: patient} do
      conn = put(conn, Routes.patient_path(conn, :update, patient), patient: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete patient" do
    setup [:create_patient]

    test "deletes chosen patient", %{conn: conn, patient: patient} do
      conn = delete(conn, Routes.patient_path(conn, :delete, patient))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.patient_path(conn, :show, patient))
      end
    end
  end

  defp create_patient(_) do
    patient = fixture(:patient)
    {:ok, patient: patient}
  end
end
