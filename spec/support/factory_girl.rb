require 'factory_girl'
require 'database_cleaner'

Dir[File.expand_path("../../factories/*", __FILE__)].each do |file|
  require file
end

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods

  config.before(:suite) do
    begin
      DatabaseCleaner.start
      FactoryGirl.lint
    ensure
      DatabaseCleaner.clean
    end
  end
end
