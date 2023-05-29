# frozen_string_literal: true

require 'test_helper'

class AttributeTest < ActiveSupport::TestCase
  def setup
    @attribute = Attribute.new(
      name: 'Color'
    )
  end

  test 'should be valid with valid attributes' do
    assert @attribute.valid?
  end

  test 'should not be valid without a name' do
    @attribute.name = nil
    assert_not @attribute.valid?
  end
end
