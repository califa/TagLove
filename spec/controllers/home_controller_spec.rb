require 'spec_helper'

describe HomeController do

  describe "GET 'signup'" do
    it "returns http success" do
      get 'signup'
      response.should be_success
    end
  end

end
