require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/abouts", type: :request do
  
  # This should return the minimal set of attributes required to create a valid
  # About. As you add validations to About, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      About.create! valid_attributes
      get abouts_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      about = About.create! valid_attributes
      get about_url(about)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_about_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      about = About.create! valid_attributes
      get edit_about_url(about)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new About" do
        expect {
          post abouts_url, params: { about: valid_attributes }
        }.to change(About, :count).by(1)
      end

      it "redirects to the created about" do
        post abouts_url, params: { about: valid_attributes }
        expect(response).to redirect_to(about_url(About.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new About" do
        expect {
          post abouts_url, params: { about: invalid_attributes }
        }.to change(About, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post abouts_url, params: { about: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested about" do
        about = About.create! valid_attributes
        patch about_url(about), params: { about: new_attributes }
        about.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the about" do
        about = About.create! valid_attributes
        patch about_url(about), params: { about: new_attributes }
        about.reload
        expect(response).to redirect_to(about_url(about))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        about = About.create! valid_attributes
        patch about_url(about), params: { about: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested about" do
      about = About.create! valid_attributes
      expect {
        delete about_url(about)
      }.to change(About, :count).by(-1)
    end

    it "redirects to the abouts list" do
      about = About.create! valid_attributes
      delete about_url(about)
      expect(response).to redirect_to(abouts_url)
    end
  end
end