get '/people' do
	@people = Person.all
	erb :"/people/index"
end

get '/people/new' do
	@person = Person.new
	erb :"/people/new"
end

post '/people' do
	if params[:birthdate].include?("-")
		birthdate = params[:birthdate]
	else
		birthdate = Date.strptime(params[:birthdate], "%m%d%Y")
	end
	person = Person.create(first_name: params[:first_name],
	last_name: params[:last_name], birthdate: params[:birthdate])
	redirect "/people/#{person.id}"
end

get '/people/:id/edit' do
	@person = Person.find(params[:id])
	erb :"/people/edit"
end

get '/people/:id' do
	@person = Person.find(params[:id])
	birthdate_string = @person.birthdate.strftime("%m%d%Y")
	bpn = Person.determine_birth_path_number(birthdate_string)
	@message = Person.determine_message(bpn)
	erb :"/people/show"
end

put '/people/:id' do
	person = Person.find(params[:id])
	person.first_name = params[:first_name]
	person.last_name = params[:last_name]
	person.birthdate = params[:birthdate]
	person.save
	redirect "/people/#{person.id}"
end

delete '/people/:id' do
	person = Person.find(params[:id])
	person.destroy
	redirect "/people"
end
