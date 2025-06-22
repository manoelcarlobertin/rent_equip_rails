
require 'rails_helper'

RSpec.describe Customer, type: :model do
  subject(:customer) { build(:customer) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }

    it 'validates name format allowing only letters and spaces' do
      customer.name = 'Nome Válido'
      expect(customer).to be_valid

      customer.name = '123456'
      expect(customer).not_to be_valid

      customer.name = 'Nome123'
      expect(customer).not_to be_valid

      customer.name = 'Nome Com Espaços'
      expect(customer).to be_valid
    end
  end

  context 'when validating date of birth' do
    it { is_expected.to validate_presence_of(:dob) }

    it 'validates date is not in the future' do
      customer.dob = Date.tomorrow
      expect(customer).not_to be_valid
      expect(customer.errors[:dob]).to include('cannot be in the future')
    end

    it 'validates customer is at least 18 years old' do
      customer.dob = 17.years.ago
      expect(customer).not_to be_valid
      expect(customer.errors[:dob]).to include('must be at least 18 years old')
    end
  end

  context 'when validating email' do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }

    it 'validates email format' do
      valid_emails = ['user@example.com', 'user.name@domain.com.br']
      invalid_emails = ['invalid_email', '@example.com', 'user@', 'user@.com']

      valid_emails.each do |email|
        customer.email = email
        expect(customer).to be_valid
      end

      invalid_emails.each do |email|
        customer.email = email
        expect(customer).not_to be_valid
        expect(customer.errors[:email]).to include('is invalid')
      end
    end
  end

  context 'when validating mobile phone' do
    it { is_expected.to validate_presence_of(:mobile_phone) }

    it 'validates mobile phone format' do
      valid_phones = ['(11) 98888-8888', '11988888888']
      invalid_phones = ['1234', '(11) 8888-8888', 'abc12345678']

      valid_phones.each do |phone|
        customer.mobile_phone = phone
        expect(customer).to be_valid
      end

      invalid_phones.each do |phone|
        customer.mobile_phone = phone
        expect(customer).not_to be_valid
        expect(customer.errors[:mobile_phone]).to include('is invalid')
      end
    end
  end
end
