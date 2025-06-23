class User < ApplicationRecord
  enum role: { admin: "admin", operator: "operator" }, _prefix: true

  validates :role, presence: true, inclusion: { in: roles.keys }

  # Explicação dos papéis:
  # admin: usuário com acesso total ao sistema
  # operator: usuário com permissões limitadas para operações específicas

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
