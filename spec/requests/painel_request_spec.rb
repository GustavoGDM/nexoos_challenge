require 'rails_helper'

RSpec.describe "Painels", type: :request do

  describe "GET /index" do
    it "return http error" do
      get "/painel/index"
      expect(response).to have_http_status(302)
    end
  end

end
