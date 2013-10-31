require 'spec_helper'

describe UsersController do
  it "#new" do
    get :new
    response.status.should eq(200)
  end

end