require 'rails_helper'

RSpec.describe "phone_numbers/edit", type: :view do
  let(:person) { Person.create(:first_name => "Bob", :last_name => "Smith") }
    let(:phone_number) { PhoneNumber.create!(:contact_id => person.id, :contact_type => "Person", :number => "MyNumber") }
    before(:each) do
      assign(:phone_number, phone_number)
    end


  before(:each) do
    @phone_number = assign(:phone_number, PhoneNumber.create!(
      :number => "MyString",
      :contact_id => 1,
      :contact_type => 'Person'
    ))
  end

  it "renders the edit phone_number form" do
    render

    assert_select "form[action=?][method=?]", phone_number_path(@phone_number), "post" do

      assert_select "input#phone_number_number[name=?]", "phone_number[number]"

      assert_select "input#phone_number_contact_id[name=?]", "phone_number[contact_id]"
    end
  end

  it "shows the contacts name in the title" do
    render
    assert_select("h1", text: "Edit Phone Number for #{phone_number.contact.first_name} #{phone_number.contact.last_name}")
  end


end
