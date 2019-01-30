defmodule Appointment.AppointmentsTest do
  use Appointment.DataCase

  alias Appointment.Appointments

  describe "doctors" do
    alias Appointment.Appointments.Doctor

    @valid_attrs %{age: 42, email: "some email", gender: "some gender", name: "some name", qualification: "some qualification", speciality: "some speciality"}
    @update_attrs %{age: 43, email: "some updated email", gender: "some updated gender", name: "some updated name", qualification: "some updated qualification", speciality: "some updated speciality"}
    @invalid_attrs %{age: nil, email: nil, gender: nil, name: nil, qualification: nil, speciality: nil}

    def doctor_fixture(attrs \\ %{}) do
      {:ok, doctor} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Appointments.create_doctor()

      doctor
    end

    test "list_doctors/0 returns all doctors" do
      doctor = doctor_fixture()
      assert Appointments.list_doctors() == [doctor]
    end

    test "get_doctor!/1 returns the doctor with given id" do
      doctor = doctor_fixture()
      assert Appointments.get_doctor!(doctor.id) == doctor
    end

    test "create_doctor/1 with valid data creates a doctor" do
      assert {:ok, %Doctor{} = doctor} = Appointments.create_doctor(@valid_attrs)
      assert doctor.age == 42
      assert doctor.email == "some email"
      assert doctor.gender == "some gender"
      assert doctor.name == "some name"
      assert doctor.qualification == "some qualification"
      assert doctor.speciality == "some speciality"
    end

    test "create_doctor/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Appointments.create_doctor(@invalid_attrs)
    end

    test "update_doctor/2 with valid data updates the doctor" do
      doctor = doctor_fixture()
      assert {:ok, %Doctor{} = doctor} = Appointments.update_doctor(doctor, @update_attrs)
      assert doctor.age == 43
      assert doctor.email == "some updated email"
      assert doctor.gender == "some updated gender"
      assert doctor.name == "some updated name"
      assert doctor.qualification == "some updated qualification"
      assert doctor.speciality == "some updated speciality"
    end

    test "update_doctor/2 with invalid data returns error changeset" do
      doctor = doctor_fixture()
      assert {:error, %Ecto.Changeset{}} = Appointments.update_doctor(doctor, @invalid_attrs)
      assert doctor == Appointments.get_doctor!(doctor.id)
    end

    test "delete_doctor/1 deletes the doctor" do
      doctor = doctor_fixture()
      assert {:ok, %Doctor{}} = Appointments.delete_doctor(doctor)
      assert_raise Ecto.NoResultsError, fn -> Appointments.get_doctor!(doctor.id) end
    end

    test "change_doctor/1 returns a doctor changeset" do
      doctor = doctor_fixture()
      assert %Ecto.Changeset{} = Appointments.change_doctor(doctor)
    end
  end
end
