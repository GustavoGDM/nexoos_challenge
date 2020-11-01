require 'rails_helper'

RSpec.describe "SimulateLoans", type: :request do

  # describe "GET /index" do
  #   it "returns http success" do
  #     get "/simulate_loan/index"
  #     expect(response).to have_http_status(:success)
  #   end
  # end
  
  describe "GET /new" do
    it "return http error" do
      get "/simulate_loan"
      expect(response).to have_http_status(302)
    end
  end

end
