require 'rails_helper'

RSpec.describe "abouts/show", type: :view do
  before(:each) do
    @about = assign(:about, About.create!(
      index: "Index"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Index/)
  end
end
