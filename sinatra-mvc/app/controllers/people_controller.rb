get '/people' do 
	@people = Person.all 
	erb :"/people/index"
end

get '/people/:id' do
	@person = Person.find(params[:id])
	birthdate_string = @person.birthdate.strftime("%m%d%Y")
	bpn = Person.determine_birth_path_number(birthdate_string)
	@message = Person.determine_message(bpn)
	erb :"/people/show"
end