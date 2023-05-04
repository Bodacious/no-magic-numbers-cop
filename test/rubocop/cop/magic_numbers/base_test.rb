# frozen_string_literal: true

require 'test_helper'
require 'rubocop/no_magic_numbers'

module RuboCop
  module Cop
    module MagicNumbers
      class BaseTest < ::Minitest::Test
        def test_config_defaults
          config = RuboCop::Config.new('MagicNumbers/NoReturn' => { 'Enabled' => true })
          cop = RuboCop::Cop::MagicNumbers::NoReturn.new(config)

          assert_equal(cop.cop_config['ForbiddenNumerics'], 'All')
        end

        def test_config_with_defaults_changed
          config = RuboCop::Config.new('MagicNumbers/NoReturn' => {
            'Enabled' => true,
            'ForbiddenNumerics' => 'Float'
          })
          cop = RuboCop::Cop::MagicNumbers::NoReturn.new(config)

          assert_equal(cop.cop_config['ForbiddenNumerics'], 'Float')
        end
      end
    end
  end
end