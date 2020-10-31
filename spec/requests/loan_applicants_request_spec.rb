require 'rails_helper'

RSpec.describe "LoanApplicants", type: :request do

  # describe "GET /new" do
  #   it "returns http success" do
  #     get "/loan_applicant/new"
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  describe "GET /new" do
    it "return http error" do
      get "/loan_applicants/new"
      expect(response).to have_http_status(302)
    end
  end

end
