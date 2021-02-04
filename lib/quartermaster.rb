# frozen_string_literal: true

require_relative "./quartermaster/version"
require_relative "./quartermaster/cli"
require_relative "./quartermaster/api"
require_relative "./quartermaster/magic-item"
require "pry"
require "rest-client"
require "json"

module Quartermaster
  class Error < StandardError; end
  # Your code goes here...
end