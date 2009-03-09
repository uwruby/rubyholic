class GroupsController < ApplicationController
  def index
    @location = GeoIPClient.city(request.headers['REMOTE_HOST'])
    @groups = Group.find(:all)
  end
end
