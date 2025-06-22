require 'rails_helper'

RSpec.describe Equipment, type: :model do
  # Testa se o modelo é válido com atributos válidos
  it "is valid with valid attributes" do
    equipment = Equipment.new(name: "Equipamento 1", serial_number: "12345")
    expect(equipment).to be_valid
  end

  # Testa presença do nome
  it { should validate_presence_of(:name) }

  # Testa presença do número de série
  it { should validate_presence_of(:serial_number) }

  # Testa unicidade do número de série
  it { should validate_uniqueness_of(:serial_number) }
end
