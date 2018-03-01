class TestLogger
  class << self
    def log(spec, message)
      puts "#{spec.class.name}(#{spec.object_id}): #{message}"
    end

    def log_example(spec, description)
      puts "#{spec.class.name}(#{spec.object_id}): #{description}"
      puts
    end
  end
end
