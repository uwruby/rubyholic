require 'test_helper'

class GroupTest < ActiveSupport::TestCase
  test "group has events" do
    assert groups(:awesome_group).events.length > 0
  end
end
