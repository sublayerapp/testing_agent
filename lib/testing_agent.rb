require 'cli/ui'
require 'cli/kit'
require "sublayer"
require "open3"

CLI::UI::StdoutRouter.enable

module TestingAgent
  TOOL_NAME = 'testing_agent'
  ROOT      = File.expand_path('../..', __FILE__)
  LOG_FILE  = '/tmp/testing_agent.log'

  autoload(:EntryPoint, 'testing_agent/entry_point')
  autoload(:Commands,   'testing_agent/commands')

  ['generators', 'agents', 'actions'].each do |subfolder|
    Dir[File.join(ROOT, 'lib', 'testing_agent', 'sublayer', subfolder, '*.rb')].each do |file|
      require file
    end
  end

  Config = CLI::Kit::Config.new(tool_name: TOOL_NAME)
  Command = CLI::Kit::BaseCommand

  Executor = CLI::Kit::Executor.new(log_file: LOG_FILE)
  Resolver = CLI::Kit::Resolver.new(
    tool_name: TOOL_NAME,
    command_registry: TestingAgent::Commands::Registry
  )

  ErrorHandler = CLI::Kit::ErrorHandler.new(log_file: LOG_FILE)

  Sublayer.configuration.ai_model = "gpt-4o"
end
