require 'rails_helper'

RSpec.describe EmailAddress, type: :model do
  let(:email_address) { EmailAddress.new({ address: 'hi@abc.com', person_id: 2 }) }

  it 'is valid' do
    expect(email_address).to be_valid
  end

  it 'is invalid without an address' do
    email_address.address = nil
    expect(email_address).to be_invalid
  end

  it 'is invalid without a person_id' do
    email_address.person_id = nil
    expect(email_address).to be_invalid
  end

end
