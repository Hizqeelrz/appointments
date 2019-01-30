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

  describe "patients" do
    alias Appointment.Appointments.Patient

    @valid_attrs %{address: "some address", age: 42, city: "some city", email: "some email", firstname: "some firstname", gender: "some gender", lastname: "some lastname", phone: 42, state: "some state"}
    @update_attrs %{address: "some updated address", age: 43, city: "some updated city", email: "some updated email", firstname: "some updated firstname", gender: "some updated gender", lastname: "some updated lastname", phone: 43, state: "some updated state"}
    @invalid_attrs %{address: nil, age: nil, city: nil, email: nil, firstname: nil, gender: nil, lastname: nil, phone: nil, state: nil}

    def patient_fixture(attrs \\ %{}) do
      {:ok, patient} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Appointments.create_patient()

      patient
    end

    test "list_patients/0 returns all patients" do
      patient = patient_fixture()
      assert Appointments.list_patients() == [patient]
    end

    test "get_patient!/1 returns the patient with given id" do
      patient = patient_fixture()
      assert Appointments.get_patient!(patient.id) == patient
    end

    test "create_patient/1 with valid data creates a patient" do
      assert {:ok, %Patient{} = patient} = Appointments.create_patient(@valid_attrs)
      assert patient.address == "some address"
      assert patient.age == 42
      assert patient.city == "some city"
      assert patient.email == "some email"
      assert patient.firstname == "some firstname"
      assert patient.gender == "some gender"
      assert patient.lastname == "some lastname"
      assert patient.phone == 42
      assert patient.state == "some state"
    end

    test "create_patient/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Appointments.create_patient(@invalid_attrs)
    end

    test "update_patient/2 with valid data updates the patient" do
      patient = patient_fixture()
      assert {:ok, %Patient{} = patient} = Appointments.update_patient(patient, @update_attrs)
      assert patient.address == "some updated address"
      assert patient.age == 43
      assert patient.city == "some updated city"
      assert patient.email == "some updated email"
      assert patient.firstname == "some updated firstname"
      assert patient.gender == "some updated gender"
      assert patient.lastname == "some updated lastname"
      assert patient.phone == 43
      assert patient.state == "some updated state"
    end

    test "update_patient/2 with invalid data returns error changeset" do
      patient = patient_fixture()
      assert {:error, %Ecto.Changeset{}} = Appointments.update_patient(patient, @invalid_attrs)
      assert patient == Appointments.get_patient!(patient.id)
    end

    test "delete_patient/1 deletes the patient" do
      patient = patient_fixture()
      assert {:ok, %Patient{}} = Appointments.delete_patient(patient)
      assert_raise Ecto.NoResultsError, fn -> Appointments.get_patient!(patient.id) end
    end

    test "change_patient/1 returns a patient changeset" do
      patient = patient_fixture()
      assert %Ecto.Changeset{} = Appointments.change_patient(patient)
    end
  end
end
