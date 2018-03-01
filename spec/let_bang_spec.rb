
require_relative '../test_logger'

RSpec.describe 'LetPlayGround' do
  let!(:some_data) do
    TestLogger.log self, 'calculate some data'
    'some data'
  end

  it 'works' do |example|
    TestLogger.log self, some_data
    TestLogger.log self, some_data
    TestLogger.log_example self, example.description
  end

  it 'works second time' do |example|
    TestLogger.log self, some_data
    TestLogger.log self, some_data
    TestLogger.log_example self, example.description
  end
end
