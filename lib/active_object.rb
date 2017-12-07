# frozen_string_literal: true

%w[version configuration kernel array date enumerable hash integer numeric object range string time]
  .each do |file_name|
    require "active_object/#{file_name}"
  end

require 'generators/active_object/install_generator'
