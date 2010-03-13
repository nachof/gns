class UsersController < ApplicationController

  def index

    @users = User.with_substring(params[:q]).map { |u| u }
    #@users = [ { :a => 1, :b => 2 }, { :a => 1, :b => 3 } ]
    respond_to do |wants|
      wants.json { render :json => @users }
    end
  end
end
