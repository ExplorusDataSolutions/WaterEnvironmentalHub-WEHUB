require 'spec_helper'

describe UserController do

  describe "GET 'sign_in'" do
    it "should be successful" do
      get 'sign_in'
      response.should be_success
    end
  end

end
