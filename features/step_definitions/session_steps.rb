require 'rest_client'

Given /^a game session started elsewhere$/ do
  @fake_session = {:session => {:session_id => "fakesession", :user => "fakeuser"}, :version=>1 }
end

When /^I send the game session to the session controller$/ do
  @fake_session_as_json = ActiveSupport::JSON.encode(@fake_session)
  @response = RestClient.post "localhost:3000/sessions", @fake_session_as_json, :content_type => :json, :accept => :json
end

Then /^I should see the session data in return$/ do
  assert_nothing_raised do
    json=ActiveSupport::JSON.decode(@response.body)
    json['session_id'].should == @fake_session[:session][:session_id]
    json['user'].should == @fake_session[:session][:user]
  end
end