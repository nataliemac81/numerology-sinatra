get '/' do
	@people = Person.all
	erb :"/people/index"
end

get '/new' do
	erb :"/people/new"
end

get '/:id' do
	@person = Person.find(params[:id])
	birthdate_string = @person.birthdate.strftime("%m%d%Y")
	bpn = Person.determine_birth_path_number(birthdate_string)
	@message = Person.determine_message(bpn)
	erb :"/people/show"
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
