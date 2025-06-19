require 'rails_helper'

RSpec.describe "equipment/index", type: :view do
  before(:each) do
    assign(:equipment, [
      Equipment.create!(
        name: "Name",
        serial_number: "Serial Number"
      ),
      Equipment.create!(
        name: "Name",
        serial_number: "Serial Number"
      )
    ])
  end

  it "renders a list of equipment" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Serial Number".to_s), count: 2
  end
end
