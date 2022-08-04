require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  subject { User.new(name: 'Joe', email: 'mail@mail', password: 'password') }

  it 'should have name' do
    expect(subject.name).to eq('Joe')
    expect(subject).to be_valid
  end

  it 'should have email' do
    expect(subject.email).to eq('mail@mail')
    expect(subject).to be_valid
  end

  it 'should have password' do
    expect(subject.password).to eq('password')
    expect(subject).to be_valid
  end

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'email should be present' do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it 'password should be present' do
    subject.password = ''
    expect(subject).to_not be_valid
  end
end
