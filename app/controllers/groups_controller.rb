class GroupsController < ApplicationController
  def index
    @location = GeoIPClient.city(request.headers['REMOTE_HOST'])
    if params[:q]
      @groups = Group.search(params[:q])
    else
      @groups = Group.all
    end
  end
end
