module Sublayer
  module Generators
    class ModifiedImplementationToPassTestsGenerator < Sublayer::Generators::Base
      llm_output_adapter type: :single_string,
        name: "generated_implementation",
        description: "The modified implementation that makes all tests pass"

      def initialize(implementation_file_contents:, test_file_contents:, test_output:)
        @implementation_file_contents = implementation_file_contents
        @test_file_contents = test_file_contents
        @test_output = test_output
      end

      def generate
          puts "Generating"
        super
      end

      def prompt
        <<-PROMPT
        You have the initial implementation, the test files, and the test outputs in your hands.

        You are tasked with modifying the initial implementation so all the tests defined in the test files will pass according to the given test outputs.

        Consider each failing test and how the initial implementation can be adjusted to meet the expectations.
        The implementation file is #{@implementation_file_contents}
        the test file contents are: #{@test_file_contents}
        the test output is: #{@test_output}

        Take a deep breath and reflect on each line of code before proceeding with modifications.
        PROMPT
      end
    end
  end
end
