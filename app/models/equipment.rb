class Equipment < ApplicationRecord
  has_many :schedules, dependent: :destroy
  has_rich_text :description
  # Validação para garantir que o nome esteja presente
  validates :name, presence: true

  # Validação para garantir que o número de série seja único e presente
  validates :serial_number, presence: true, uniqueness: true
end
