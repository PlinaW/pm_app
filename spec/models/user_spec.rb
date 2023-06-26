require 'rails_helper'

RSpec.describe User, type: :model do
  it 'first_name is MyString' do
    user = create(:user)
    expect(user.first_name).to eq('MyString')
  end
end
