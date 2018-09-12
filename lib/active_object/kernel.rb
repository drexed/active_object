# frozen_string_literal: true

if ActiveObject.configuration.autoload_kernel
  module Kernel

    # rubocop:disable Lint/RescueException, Security/Eval
    def try_eval
      eval(self)
    rescue Exception
      self
    end
    # rubocop:enable Lint/RescueException, Security/Eval

    private

    # rubocop:disable Style/PerlBackrefs
    def caller_name
      caller(1..1).first =~ /`([^']*)'/ && $1
    end
    # rubocop:enable Style/PerlBackrefs

  end
end
