# frozen_string_literal: true

if ActiveObject.configuration.autoload_kernel
  module Kernel

    SANITIZE_EVAL_REGEX ||= /\[\d*,?\d*,?\d*\]/

    # rubocop:disable Lint/RescueException, Security/Eval
    def safe_eval
      eval(self)
    rescue Exception
      self
    end

    def try_eval
      val = SANITIZE_EVAL_REGEX.match(to_s).to_s
      return if val.nil?

      eval(val)
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
