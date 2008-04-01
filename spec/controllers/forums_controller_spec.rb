require File.dirname(__FILE__) + '/../spec_helper'

describe ForumsController do
  integrate_views
  
  before(:each) do
    @person = login_as(:quentin)
  end
  
  it "should redirect to the topics if there is only one forum" do
    Forum.count.should == 1
    get :index
    response.should redirect_to(forum_topics_url(Forum.find(:first)))
  end
  
  it "should show the forums if there are more than one forum" do
    Forum.create(:name => "Foo bar")
    get :index
    response.should be_success
  end
  it "should only allow admins to create, edit, or destroy forums" 
end
