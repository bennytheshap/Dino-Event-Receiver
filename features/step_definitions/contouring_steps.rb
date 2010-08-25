require 'rest_client'

Given /^a contouring$/ do
  @fake_contouring = {:contouring => { :session_id => @fake_session[:session][:id],
                                     :chapter_id => "yourmom",
                                     :accuracy_score => 42,
                                     :overlap_score => 42,
                                     :image_width => 600,
                                     :image_height => 400,
                                     :view_width => 300,
                                     :view_height => 200,                                 
                                     # :points => [
                                     #  {:x => 10, :y => 12, :radius => 3, :colored => true, :when => Time.now},
                                     #  {:x => 4, :y => 8, :radius => 6, :colored => false, :when => Time.now},
                                     # ]
                                    }, :version=>1 }
end

When /^I send the contouring data to the contouring controller$/ do
  @fake_contouring_as_json = ActiveSupport::JSON.encode(@fake_contouring)
  @response = RestClient.post "localhost:3000/contourings", @fake_contouring_as_json, :content_type => :json, :accept => :json
end

Then /^I should see the contouring data in return$/ do
  assert_nothing_raised do
    json=ActiveSupport::JSON.decode(@response.body)
    json['id'].should be_an_instance_of(String)
    @fake_contouring[:contouring][:id] = json['id']
  end
end

