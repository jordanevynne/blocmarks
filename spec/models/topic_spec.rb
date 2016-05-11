require 'rails_helper'

RSpec.describe Topic, type: :model do
  let(:topic) { Topic.create!(title: "topic") }

  describe "attributes" do
    it "has a title" do
      expect(topic).to have_attributes(title: "topic")
    end
  end
end
