defmodule AppointmentWeb.DoctorControllerTest do
  use AppointmentWeb.ConnCase

  alias Appointment.Appointments
  alias Appointment.Appointments.Doctor

  @create_attrs %{
    age: 42,
    email: "some email",
    gender: "some gender",
    name: "some name",
    qualification: "some qualification",
    speciality: "some speciality"
  }
  @update_attrs %{
    age: 43,
    email: "some updated email",
    gender: "some updated gender",
    name: "some updated name",
    qualification: "some updated qualification",
    speciality: "some updated speciality"
  }
  @invalid_attrs %{age: nil, email: nil, gender: nil, name: nil, qualification: nil, speciality: nil}

  def fixture(:doctor) do
    {:ok, doctor} = Appointments.create_doctor(@create_attrs)
    doctor
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all doctors", %{conn: conn} do
      conn = get(conn, Routes.doctor_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create doctor" do
    test "renders doctor when data is valid", %{conn: conn} do
      conn = post(conn, Routes.doctor_path(conn, :create), doctor: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.doctor_path(conn, :show, id))

      assert %{
               "id" => id,
               "age" => 42,
               "email" => "some email",
               "gender" => "some gender",
               "name" => "some name",
               "qualification" => "some qualification",
               "speciality" => "some speciality"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.doctor_path(conn, :create), doctor: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update doctor" do
    setup [:create_doctor]

    test "renders doctor when data is valid", %{conn: conn, doctor: %Doctor{id: id} = doctor} do
      conn = put(conn, Routes.doctor_path(conn, :update, doctor), doctor: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.doctor_path(conn, :show, id))

      assert %{
               "id" => id,
               "age" => 43,
               "email" => "some updated email",
               "gender" => "some updated gender",
               "name" => "some updated name",
               "qualification" => "some updated qualification",
               "speciality" => "some updated speciality"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, doctor: doctor} do
      conn = put(conn, Routes.doctor_path(conn, :update, doctor), doctor: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete doctor" do
    setup [:create_doctor]

    test "deletes chosen doctor", %{conn: conn, doctor: doctor} do
      conn = delete(conn, Routes.doctor_path(conn, :delete, doctor))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.doctor_path(conn, :show, doctor))
      end
    end
  end

  defp create_doctor(_) do
    doctor = fixture(:doctor)
    {:ok, doctor: doctor}
  end
end
