require 'testing_agent'

module TestingAgent
  module Commands
    Registry = CLI::Kit::CommandRegistry.new(default: 'help')

    def self.register(const, cmd, path)
      autoload(const, path)
      Registry.add(->() { const_get(const) }, cmd)
    end

    register :PairOn, 'pair_on', 'testing_agent/commands/pair_on'
    register :Help,    'help',    'testing_agent/commands/help'
  end
end
