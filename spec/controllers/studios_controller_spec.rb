require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe StudiosController, :type => :controller do

  # This should return the minimal set of attributes required to create a valid
  # Studio. As you add validations to Studio, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    attrs = attributes_for :studio
  }

  let(:invalid_attributes) {
    attrs = attributes_for :genre
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # StudiosController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all studios as @studios" do
      studio = Studio.all.to_json
      get :index, {}, valid_session
      expect(assigns(:studios).to_json).to eq(studio)
    end
  end

  describe "GET show" do
    it "assigns the requested studio as @studio" do
      studio = Studio.create! valid_attributes
      get :show, {:id => studio.to_param}, valid_session
      expect(assigns(:studio).first).to eq(studio)
    end
  end

  describe "POST create" do
    it "should create a new studio with Pusher" do

      params = {:studio => valid_attributes}
      post :create, params, valid_session

      studio = assigns(:studio)

      # binding.pry

      expect(studio).to be_an(Studio)
      expect(studio.name).to be_a(String)
      expect(studio.description).to be_a(String)

      expect(studio.errors.size).to  eq(0)
    end

    it "should fail creating a new studio with Pusher" do

      params = {:not_studio => valid_attributes}
      post :create, params, valid_session

      studio = assigns(:studio)

      expect(studio.errors.size).to_not  eq(0)
      puts studio.errors
    end
  end

  describe "PUT update" do
    it "should update an studio with Pusher" do

      id = Studio.first.id;
      attrs = valid_attributes
      attrs[:name] = "Name #{Time.now.to_s}"
      params = {:id => id, :studio => attrs}
      # binding.pry
      put :update, params, valid_session

      studio = assigns(:studio)

      # binding.pry

      expect(studio).to be_an(Studio)
      expect(studio.name).to eq(valid_attributes[:name])

      expect(studio.errors.size).to  eq(0)
    end

    it "should fail updating an studio with Pusher" do

      id = Studio.first.id;
      attrs = valid_attributes
      attrs[:name] = nil

      params = {:id => id, :studio => attrs}
      put :update, params, valid_session


      studio = assigns(:studio)

      # binding.pry
      expect(studio.errors.size).not_to  eq(0)
    end
  end

  describe "DELETE destroy" do
    it "should delete an studio with Pusher" do

      studio = Studio.first

      delete :destroy, {:id => studio.id}, valid_session

      expect(studio).not_to eq(Studio.first)
    end

  end

end
