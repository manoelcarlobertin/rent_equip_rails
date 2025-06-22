# spec/rails_helper.rb
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)

abort("The Rails environment is running in production mode!") if Rails.env.production?

require 'rspec/rails'
# Patch para corrigir erro de ENCODING_FLAG no Rails 8 com RSpec
# module ActionView
#   module Template::Handlers::ERB
#     ENCODING_FLAG = 0 unless const_defined?(:ENCODING_FLAG)
#   end
# end
# Carrega arquivos de suporte
Dir[Rails.root.join('spec', 'support', '**', '*.rb')].sort.each { |f| require f }
# Adicione outras requires aqui, se precisar
require 'support/factory_bot'
require 'support/shoulda_matchers'
# Configurações do RSpec
RSpec.configure do |config|
config.fixture_path = ["#{::Rails.root}/spec/fixtures"]
  config.use_transactional_fixtures = true # Limpa o banco entre os testes
  config.filter_rails_from_backtrace!
  config.include FactoryBot::Syntax::Methods
end
# Configura Shoulda Matchers (se estiver usando)
Shoulda::Matchers.configure do |shoulda_config|
  shoulda_config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end
