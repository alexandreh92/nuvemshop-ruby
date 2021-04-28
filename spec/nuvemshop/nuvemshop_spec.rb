RSpec.describe Nuvemshop do
  before do
    described_class.configure do |config|
      config.client_id = '123456'
      config.client_secret = '54321'
      config.user_agent = 'Foo'
      config.store_access_token = '123123'
      config.store_user_id = '9876'
    end
  end

  it 'sets client_id' do
    expect(described_class.client_id).to eq('123456')
  end

  it 'sets client_secret' do
    expect(described_class.client_secret).to eq('54321')
  end

  it 'sets user_agent' do
    expect(described_class.user_agent).to eq('Foo')
  end

  it 'sets store_access_token' do
    expect(described_class.store_access_token).to eq('123123')
  end

  it 'sets store_user_id' do
    expect(described_class.store_user_id).to eq('9876')
  end
end
