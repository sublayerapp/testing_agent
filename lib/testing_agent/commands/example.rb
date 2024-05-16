require 'testing_agent'

module TestingAgent
  module Commands
    class Example < TestingAgent::Command
      def call(_args, _name)
        puts 'neato'

        if rand < 0.05
          raise(CLI::Kit::Abort, "you got unlucky!")
        end
      end

      def self.help
        "A dummy command.\nUsage: {{command:#{TestingAgent::TOOL_NAME} example}}"
      end
    end
  end
end
