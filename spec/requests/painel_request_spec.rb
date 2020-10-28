require 'rails_helper'

RSpec.describe "Painels", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/painel/index"
      expect(response).to have_http_status(:success)
    end
  end

end
