require 'testing_agent'

module TestingAgent
  module EntryPoint
    def self.call(args)
      cmd, command_name, args = TestingAgent::Resolver.call(args)
      TestingAgent::Executor.call(cmd, command_name, args)
    end
  end
end
