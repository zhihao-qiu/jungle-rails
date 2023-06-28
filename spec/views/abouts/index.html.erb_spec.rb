require 'rails_helper'

RSpec.describe "abouts/index", type: :view do
  before(:each) do
    assign(:abouts, [
      About.create!(
        index: "Index"
      ),
      About.create!(
        index: "Index"
      )
    ])
  end

  it "renders a list of abouts" do
    render
    assert_select "tr>td", text: "Index".to_s, count: 2
  end
end
