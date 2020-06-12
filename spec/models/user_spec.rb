require 'rails_helper'

RSpec.describe User, type: :model do

  valid_attributes = { email: "will@makers.com", username: "w1ll", name: "Will", password: "12345", password_confirmation: "12345" }

  subject = User.create { valid_attributes }

  it { is_expected.to be }

  it 'email should be present' do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it 'username should be present' do
    subject.username = nil
    expect(subject).to_not be_valid
  end

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'password should be present' do
    subject.password = nil
    expect(subject).to_not be_valid
  end

  it 'password confirmation should be present' do
    subject.password_confirmation = nil
    expect(subject).to_not be_valid
  end

  it 'subject with all attributes is valid' do
    expect(subject).to_not be_valid
  end

end
