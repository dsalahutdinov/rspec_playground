require_relative '../test_logger.rb'

RSpec.configure do |config|
  config.before(:all) do
    TestLogger.log self, 'config: before(:all)'
  end
end

RSpec.describe 'BeforeAllPlayGround' do
  before(:all) do
    TestLogger.log self, 'describe: before(:all)'
  end

  it 'works' do |example|
    TestLogger.log_example self, example.description
  end

  context 'nested context' do
    before(:all) do
      TestLogger.log self, 'context: before(:all)'
    end

    it 'works inside context' do |example|
      TestLogger.log_example self, example.description
    end
  end
end
