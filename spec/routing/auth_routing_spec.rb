require "rails_helper"

RSpec.describe AuthController, type: :routing do
  describe "routing" do
    it "routes to #login" do
      expect(get: "/").to route_to("auth#login")
    end
  end
end