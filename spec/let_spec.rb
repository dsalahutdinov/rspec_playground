require_relative '../test_logger'

RSpec.describe 'BeforePlayGround' do
  let(:some_data) do
    TestLogger.log self, 'calculate some data'
    'some data'
  end

  it 'works' do |example|
    TestLogger.log_example self, example.description
    TestLogger.log self, some_data
    TestLogger.log self, some_data
  end
end
