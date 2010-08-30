require 'rest_client'

Given /^a set of authentication credentials$/ do
  @fake_session = {:user => {:username => "alow", :password => "123456"}, :version=>1, :session => {} }
  @fake_session = {:version=>1, :session => {} }
end



When /^I send the game session to the session controller$/ do
  @fake_session_as_json = ActiveSupport::JSON.encode(@fake_session)
  @response = RestClient.post "localhost:3000/sessions", @fake_session_as_json, :content_type => :json, :accept => :json
end

Then /^I should see the session data in return$/ do
  assert_nothing_raised do
    json=ActiveSupport::JSON.decode(@response.body)
    json['id'].should be_an_instance_of(String)
    #update the @fake_session to contain the returned id
    @fake_session[:session][:id]=json['id']
  end
end