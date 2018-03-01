# Rspec playground

# Install

Rum commands below (ensure you have docker & docker-compose installed):

```bash
git clone git@github.com:dsalahutdinov/rspec_playground.git
cd rspec_playground
make
```

# Run samples

## before(:all) callback

```bash
make rspec_before_all
```
Code:
```ruby
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
```

Will produce the following output:
```
RSpec::ExampleGroups::BeforeAllPlayGround(47161217993940): config: before(:all)
RSpec::ExampleGroups::BeforeAllPlayGround(47161217993940): describe: before(:all)
RSpec::ExampleGroups::BeforeAllPlayGround(47161217993160): works

RSpec::ExampleGroups::BeforeAllPlayGround::NestedContext(47161217973580): context: before(:all)
RSpec::ExampleGroups::BeforeAllPlayGround::NestedContext(47161217973040): works inside context
```

## before callback

```bash
make rspec_before
```
Code:
```ruby
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
```

Will produce the following output:
```
RSpec::ExampleGroups::BeforePlayGround(47169317355780): config: before
RSpec::ExampleGroups::BeforePlayGround(47169317355780): describe: before
RSpec::ExampleGroups::BeforePlayGround(47169317355780): works

RSpec::ExampleGroups::BeforePlayGround::NestedContext(47169317326040): config: before
RSpec::ExampleGroups::BeforePlayGround::NestedContext(47169317326040): describe: before
RSpec::ExampleGroups::BeforePlayGround::NestedContext(47169317326040): context: before
RSpec::ExampleGroups::BeforePlayGround::NestedContext(47169317326040): work inside context
```

## let(:some_var) test data definition

```bash
make rspec_let
```
Code:
```ruby
require_relative '../test_logger'

RSpec.describe 'LetPlayground' do
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
```

Will product the following output:
```
RSpec::ExampleGroups::LetPlayground(47176036693900): works

RSpec::ExampleGroups::LetPlayground(47176036693900): calculate some data
RSpec::ExampleGroups::LetPlayground(47176036693900): some data
RSpec::ExampleGroups::LetPlayground(47176036693900): some data
```

## let!(:some_var) test data definition

```bash
make rspec_let_bang
```
Code:
```ruby
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
```

Will product the following output:
```
RSpec::ExampleGroups::LetPlayGround(46970354384800): calculate some data
RSpec::ExampleGroups::LetPlayGround(46970354384800): some data
RSpec::ExampleGroups::LetPlayGround(46970354384800): some data
RSpec::ExampleGroups::LetPlayGround(46970354384800): works

RSpec::ExampleGroups::LetPlayGround(46970354381360): calculate some data
RSpec::ExampleGroups::LetPlayGround(46970354381360): some data
RSpec::ExampleGroups::LetPlayGround(46970354381360): some data
RSpec::ExampleGroups::LetPlayGround(46970354381360): works second time
```
