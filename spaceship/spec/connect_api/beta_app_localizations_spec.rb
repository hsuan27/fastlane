describe Spaceship::ConnectAPI::TestFlight::BetaAppLocalization do
  before { Spaceship::Tunes.login }
  let(:client) { Spaceship::ConnectAPI::TestFlight::Base.client }

  describe '#client' do
    it 'succeeds with object' do
      response = client.get_beta_app_localizations

      expect(response).to be_an_instance_of(Spaceship::ConnectAPI::Response)
      expect(response.count).to eq(1)
      response.each do |model|
        expect(model).to be_an_instance_of(Spaceship::ConnectAPI::TestFlight::BetaAppLocalization)
      end

      model = response.first

      expect(model.id).to eq("123456789")
      expect(model.feedback_email).to eq("email@email.com")
      expect(model.marketing_url).to eq("https://fastlane.tools/marketing")
      expect(model.privacy_policy_url).to eq("https://fastlane.tools/policy")
      expect(model.tv_os_privacy_policy).to eq(nil)
      expect(model.description).to eq("This is a description of my app")
      expect(model.locale).to eq("en-US")
    end
  end
end