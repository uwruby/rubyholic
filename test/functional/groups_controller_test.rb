require 'test_helper'
require 'flexmock/test_unit'

class GroupsControllerTest < ActionController::TestCase
  test "get index with IP address" do
    ip = '66.235.6.100'

    @request.env['REMOTE_HOST'] = ip

    flexmock(GeoIPClient).should_receive(:city).once.with(ip).and_return(
      [ "66.235.6.100",
        "66.235.6.100",
        "US",
        "USA",
        "United States",
        "NA",
        "WA",
        "Seattle",
        "98144",
        47.5839, -122.2995, 819, 206]
    )
    get :index
  end
end
