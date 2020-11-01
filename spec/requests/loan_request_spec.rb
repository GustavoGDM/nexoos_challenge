require 'rails_helper'

RSpec.describe "Loans", type: :request do

  # describe "GET /new" do
  #   it "returns http success" do
  #     get "/loan/new"
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  describe "GET /new" do
    it "return http error" do
      get "/loans/new"
      expect(response).to have_http_status(302)
    end
  end


end
