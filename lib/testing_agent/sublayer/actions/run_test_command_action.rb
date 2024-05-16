module Sublayer
  module Actions
    class RunTestCommandAction < Base
      def initialize(test_command:)
        @test_command = test_command
      end

      def call
        stdout, stderr, status = Open3.capture3(@test_command)
        [stdout, stderr, status]
      end
    end
  end
end
