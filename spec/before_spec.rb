require_relative '../test_logger'

RSpec.configure do |config|
  config.before do
    TestLogger.log self, 'config: before'
  end
end


RSpec.describe 'BeforePlayGround' do
  before do
    TestLogger.log self, 'describe: before'
  end

  it 'works' do |example|
    TestLogger.log_example self, example.description
  end

  context 'nested context' do
    before do
      TestLogger.log self, 'context: before'
    end

    it 'work inside context' do |example|
      TestLogger.log_example self, example.description
    end
  end
end
