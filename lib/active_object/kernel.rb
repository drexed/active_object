# frozen_string_literal: true

if ActiveObject.configuration.autoload_kernel
  module Kernel

    def try_eval
      eval(self)
    rescue Exception
      self
    end

    private

    # rubocop:disable Style/PerlBackrefs
    def caller_name
      caller(1..1).first =~ /`([^']*)'/ && $1
    end
    # rubocop:enable Style/PerlBackrefs

  end
end
