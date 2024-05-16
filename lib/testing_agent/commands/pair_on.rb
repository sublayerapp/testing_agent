require 'testing_agent'

module TestingAgent
  module Commands
    class PairOn < TestingAgent::Command
      def call(_args, _name)
        Sublayer::Agents::RspecAgent.new(implementation_file_path: _args[0], test_file_path: _args[1]).run
      end

      def self.help
        "Have an LLM continually modify the implementation file until the test command passes successfully.\n
        Usage: {{command:#{TestingAgent::TOOL_NAME} pair_on <implementation_file_path> <test_file_path>}}\n
        Example: {{command:#{TestingAgent::TOOL_NAME} pair_on lib/my_class.rb spec/my_class_spec.rb}}"
      end
    end
  end
end
