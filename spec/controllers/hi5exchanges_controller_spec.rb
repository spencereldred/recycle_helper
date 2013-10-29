require 'spec_helper'

describe Hi5exchangesController do
  describe "GET index" do
    it "should render index" do
    get :index
    response.should render_template :index
    end
  end

end
