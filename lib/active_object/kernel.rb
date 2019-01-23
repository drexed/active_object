# frozen_string_literal: true

if ActiveObject.configuration.autoload_kernel
  module Kernel

    SANITIZE_EVAL_REGEX ||= /\[\d*,?\d*,?\d*\]/.freeze
    CALLER_METHOD_REGEX ||= /`([^']*)'/.freeze

    # rubocop:disable Security/Eval
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
    # rubocop:enable Security/Eval

    private

    def caller_name(depth = 0)
      val = caller[depth][CALLER_METHOD_REGEX, 1]
      return val if depth.zero? || !val.include?('<top (required)>')

      caller[depth - 1][CALLER_METHOD_REGEX, 1]
    end

  end
end
