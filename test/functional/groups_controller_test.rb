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

  test "get with a search parameter uses sphinx" do
    ip = '66.235.6.100'

    @request.env['REMOTE_HOST'] = ip

    flexmock(Group).should_receive(:search).once.with('hello world').and_return(
      [groups(:awesome_group)]
    )
    get :index, :q => 'hello world'
  end

  test "get with no query paramter calls find(:all)" do
    flexmock(Group).should_receive(:all).once.and_return(
      [groups(:awesome_group)]
    )
    get :index
    assert_response :success
  end
end
