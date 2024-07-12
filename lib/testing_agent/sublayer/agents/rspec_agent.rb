module Sublayer
  module Agents
    class RspecAgent < Base
      def initialize(implementation_file_path:, test_file_path:)
        @implementation_file_path = implementation_file_path
        @test_file_path = test_file_path
        @tests_passing = false
      end

      trigger_on_files_changed do
        [@implementation_file_path, @test_file_path]
      end

      check_status do
        stdout, stderr, status = Sublayer::Actions::RunTestCommandAction.new( test_command: "rspec #{@test_file_path}").call
        puts stdout

        @test_output = stdout
        @tests_passing = (status.exitstatus == 0)
        @tests_passing ? puts("Tests passing") : puts("Tests failing")
      end

      goal_condition do
        @tests_passing == true
      end

      step do
        modified_implementation = Sublayer::Generators::ModifiedImplementationToPassTestsGenerator.new(
          implementation_file_contents: File.read(@implementation_file_path),
          test_file_contents: File.read(@test_file_path),
          test_output: @test_output
        ).generate

        Sublayer::Actions::WriteFileAction.new(
          file_contents: modified_implementation,
          file_path: @implementation_file_path
        ).call
      end
    end
  end
end
