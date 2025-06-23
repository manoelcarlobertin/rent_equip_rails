class Customer < ApplicationRecord
  # --- Presença ---
  validates :name, :dob, :email, :mobile_phone, presence: true
  validates :name, presence: { message: I18n.t('customers.validation.name_blank') }
  # --- Nome: apenas letras e espaços ---
  # validates :name,
  #   format: { with: /\A[a-zA-Z\s\.]+\z/, message: "only allows letters, spaces and dots" }

  # # --- Data de nascimento ---
  # validate :dob_not_in_future
  # validate :must_be_at_least_18

  # --- E-mail ---
  validates :email,
    uniqueness: { case_sensitive: false },
    format: {
      with: URI::MailTo::EMAIL_REGEXP,
      message: "is invalid"
    }

  # --- Telefone móvel (Brasil) ---
  # VALID_BR_PHONE = /\A(\(\d{2}\)\s?)?9?\d{4}-?\d{4}\z/
  # validates :mobile_phone,
  #   format: { with: VALID_BR_PHONE, message: "is invalid" }

  private

  def dob_not_in_future
    return unless dob.present? && dob > Date.current

    errors.add(:dob, "cannot be in the future")
  end

  def must_be_at_least_18
    return unless dob.present? && dob > 18.years.ago.to_date

    errors.add(:dob, "must be at least 18 years old")
  end
end
