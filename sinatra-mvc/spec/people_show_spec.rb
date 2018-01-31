require 'spec_helper'

describe "Our Person Show Route" do
  include SpecHelper
  
  before (:all) do
    @person = Person.create(first_name: "Miss", last_name: "Piggy", birthdate: DateTime.now.utc - 40.years )
    @bpn = Person.determine_birth_path_number(@person.birthdate.strftime("%m%d%Y"))
  end

  after (:all) do
    @person.delete
  end
  
  it "displays a page with the person's name when we visit /people/:id" do
    get("/people/#{@person.id}")
    expect(last_response.body.include?("#{@person.first_name} #{@person.last_name}")).to be(true)
  end
  
  it "displays the numerology result on /people/:id page" do
    get("/people/#{@person.id}")
    message = SpecHelper::NUMEROLOGY["#{@bpn}"][:message]
    expect(last_response.body.include?(message)).to be(true)
  end  
end