require 'spec_helper'

describe EpisodesController do

  login_admin

  describe "GET index" do
    it "assigns all episodes as @episodes" do
      episode = create(:episode)
      get :index, {}
      assigns(:episodes).should eq([episode])
    end
  end

  describe "GET show" do
    it "assigns the requested episode as @episode" do
      episode = create(:episode)
      get :show, {:id => episode.to_param}
      assigns(:episode).should eq(episode)
    end
  end

  describe "GET new" do
    it "assigns a new episode as @episode" do
      get :new, {}
      assigns(:episode).should be_a_new(Episode)
    end
  end

  describe "GET edit" do
    it "assigns the requested episode as @episode" do
      episode = create(:episode)
      get :edit, {:id => episode.id}
      assigns(:episode).should eq(episode)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Episode" do
        expect {
          post :create, {:episode => attributes_for(:episode)}
        }.to change(Episode, :count).by(1)
      end

      it "assigns a newly created episode as @episode" do
        post :create, {:episode => attributes_for(:episode)}
        assigns(:episode).should be_a(Episode)
        assigns(:episode).should be_persisted
      end

      it "redirects to the created episode" do
        post :create, {:episode => attributes_for(:episode)}
        response.should redirect_to(Episode.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved episode as @episode" do
        # Trigger the behavior that occurs when invalid params are submitted
        # https://stackoverflow.com/questions/3760691/what-is-the-use-of-any-instance-method-in-rails
        Episode.any_instance.stub(:save).and_return(false)
        post :create, {:episode => { "audio_file_url" => "" }}
        assigns(:episode).should be_a_new(Episode)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Episode.any_instance.stub(:save).and_return(false)
        post :create, {:episode => { "audio_file_url" => "" }}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested episode" do
        episode = create(:episode)
        # Assuming there are no other episodes in the database, this
        # specifies that the Episode created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Episode.any_instance.should_receive(:update).with({ "title" => "MyString" })
        put :update, {:id => episode.to_param, :episode => { "title" => "MyString" }}
      end

      it "assigns the requested episode as @episode" do
        episode = create(:episode)
        put :update, {:id => episode.to_param, :episode => attributes_for(:episode)}
        assigns(:episode).should eq(episode)
      end

      it "redirects to the episode" do
        episode = create(:episode)
        put :update, {:id => episode.to_param, :episode => attributes_for(:episode)}
        response.should redirect_to(episode)
      end
    end

    describe "with invalid params" do
      it "assigns the episode as @episode" do
        episode = create(:episode)
        # Trigger the behavior that occurs when invalid params are submitted
        Episode.any_instance.stub(:save).and_return(false)
        put :update, {:id => episode.to_param, :episode => { "audio_file_url" => "" }}
        assigns(:episode).should eq(episode)
      end

      it "re-renders the 'edit' template" do
        episode = create(:episode)
        # Trigger the behavior that occurs when invalid params are submitted
        Episode.any_instance.stub(:save).and_return(false)
        put :update, {:id => episode.to_param, :episode => { "audio_file_url" => "" }}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested episode" do
      episode = create(:episode)
      expect {
        delete :destroy, {:id => episode.to_param}
      }.to change(Episode, :count).by(-1)
    end

    it "redirects to the episodes list" do
      episode = create(:episode)
      delete :destroy, {:id => episode.to_param}
      response.should redirect_to(episodes_url)
    end
  end

end
