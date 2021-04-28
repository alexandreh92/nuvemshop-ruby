RSpec.shared_examples 'a configuration' do
  it { is_expected.to respond_to(:client_id) }
  it { is_expected.to respond_to(:client_id=) }
  it { is_expected.to respond_to(:client_secret) }
  it { is_expected.to respond_to(:client_secret=) }
  it { is_expected.to respond_to(:user_agent) }
  it { is_expected.to respond_to(:store_access_token) }
  it { is_expected.to respond_to(:store_user_id) }
end
