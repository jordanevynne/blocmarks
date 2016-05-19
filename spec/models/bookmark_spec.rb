require 'rails_helper'

RSpec.describe Bookmark, type: :model do
  let(:url) { "url" }
  let(:title) { "topic" }

  let(:topic) { Topic.create!(title: title) }
  let(:bookmark) { topic.bookmarks.create!(url: url) }

  it { is_expected.to belong_to(:topic) }

  describe "attributes" do
    it "has a url" do
      expect(bookmark).to have_attributes(url: url)
    end
  end
end
