# frozen_string_literal: true

if ActiveObject.configuration.autoload_kernel
  module Kernel

    private

    def caller_name
      caller[0] =~ /`([^']*)'/ and $1
    end

  end
end
