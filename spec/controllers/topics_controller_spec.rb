require 'rails_helper'

RSpec.describe TopicsController, type: :controller do
  let(:my_topic) { Topic.create(title: "topic") }

  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns my_topic to @topics" do
      get :index
      expect(assigns(:topics)).to eq([my_topic])
    end
  end

#  describe "GET #show" do
#    it "returns http success" do
#      get :show
#      expect(response).to have_http_status(:success)
#    end
#  end
#
  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to render_template :new
    end
  end

  it "instantiates @topic" do
    get :new
    expect(assigns(:topic)).not_to be_nil
  end
end

# describe "TOPIC create" do
#    it "increases the number of Topics by 1" do
#      expect{topic :create, topic: {title: "topic"}}.to change(Topic,:count).by(1)
#    end
#
#    it "assigns the new topic to @topic" do
#      topic :create, topic: {title: "topic"}
#      expect(assigns(:topic)).to eq Topic.last
#    end
#
#    it "redirects to the new topic" do
#      topic :create, topic: {title: "topic"}
#      expect(response).to redirect_to Topic.last
#    end
#  end
#
#  describe "GET #edit" do
#    it "returns http success" do
#      get :edit
#      expect(response).to have_http_status(:success)
#    end
#  end
#end
