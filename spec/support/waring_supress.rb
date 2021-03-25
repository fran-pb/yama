RSpec.configure do |config|
  config.before(:all, silent: true) do
    @with_warnings = $VERBOSE
    $VERBOSE = nil
  end

  config.after(:all, silent: true) do
    $VERBOSE = @with_warnings
  end
end
