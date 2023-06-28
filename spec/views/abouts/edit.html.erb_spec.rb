require 'rails_helper'

RSpec.describe "abouts/edit", type: :view do
  before(:each) do
    @about = assign(:about, About.create!(
      index: "MyString"
    ))
  end

  it "renders the edit about form" do
    render

    assert_select "form[action=?][method=?]", about_path(@about), "post" do

      assert_select "input[name=?]", "about[index]"
    end
  end
end
