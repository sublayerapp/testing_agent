module Sublayer
  module Generators
    class ModifiedImplementationToPassTestsGenerator < Base
      llm_output_adapter type: :single_string,
        name: "modified_implementation",
        description: "The modified implementation that will pass the tests"

      def initialize(implementation_file_contents:, test_file_contents:, test_output:)
        @implementation_file_contents = implementation_file_contents
        @test_file_contents = test_file_contents
        @test_output = test_output
      end

      def generate
        super
      end

      def prompt
        <<-PROMPT
        You are an expert in debugging and test resolution.

        You have the current implementation, the tests, and the latest failure information at your disposal.

        Your task is to modify the existing implementation using the implementation file content: #{@implementation_file_contents},
        the test file content: #{@test_file_contents},
        and the latest test output: #{@test_output},
        to ensure that the tests will pass.

        Approach this task with careful analysis and methodical thinking.
        PROMPT
      end
    end
  end
end
