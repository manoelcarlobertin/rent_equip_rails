require 'rails_helper'

RSpec.describe "equipment/edit", type: :view do
  let(:equipment) {
    Equipment.create!(
      name: "MyString",
      serial_number: "MyString"
    )
  }

  before(:each) do
    assign(:equipment, equipment)
  end

  it "renders the edit equipment form" do
    render

    assert_select "form[action=?][method=?]", equipment_path(equipment), "post" do

      assert_select "input[name=?]", "equipment[name]"

      assert_select "input[name=?]", "equipment[serial_number]"
    end
  end
end
