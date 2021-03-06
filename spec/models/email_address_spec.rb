require 'rails_helper'

RSpec.describe EmailAddress, type: :model do
  let(:email_address) { EmailAddress.new({ address: 'hi@abc.com', contact_id: 2, contact_type: 'Person' }) }

  it 'is valid' do
    expect(email_address).to be_valid
  end

  it 'is invalid without an address' do
    email_address.address = nil
    expect(email_address).to be_invalid
  end

  it 'is invalid without a person_id' do
    email_address.contact_id = nil
    expect(email_address).to be_invalid
  end

  it 'must have a reference to a contact' do
    email_address.contact_id = nil
    expect(email_address).not_to be_valid
  end

end
