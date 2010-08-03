require 'rest_client'

Given /^a patient visit$/ do
  @fake_visit = {:patient_visit => { :session_id => @fake_session[:session][:id],
                                     :chapter_id => "yourmom",
                                     :choices => [
                                      {:choice => "firstchoice", :when => Time.now},
                                      {:choice => "secondchoice", :when => Time.now}
                                     ]
                                    }, :version=>1 }
end

When /^I send the patient visit to the patient visit controller$/ do
  @fake_visit_as_json = ActiveSupport::JSON.encode(@fake_visit)
  @response = RestClient.post "localhost:3000/patient_visits", @fake_visit_as_json, :content_type => :json, :accept => :json
end

Then /^I should see the patient visit data in return$/ do
  assert_nothing_raised do
    json=ActiveSupport::JSON.decode(@response.body)
    json['chapter_id'].should == @fake_visit[:patient_visit][:chapter_id]
    json['choices'].length == @fake_visit[:patient_visit][:choices].length
  end
end
