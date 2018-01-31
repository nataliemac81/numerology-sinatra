require 'sinatra'

get '/' do
	erb :form 
end

post '/' do
    birthdate = params[:birthdate].gsub("-", "")
    if Person.valid_birthdate(birthdate)
        bpn = Person.determine_birth_path_number(birthdate)
        redirect "/message/#{bpn}"
    else 
        @error = "You should enter a valid birthdate in the form of mmddyyyy."
        erb :form
    end
end


get '/:birthdate' do
	setup_index_view
end

def setup_index_view
	@birthdate = params[:birthdate]
	bpn = Person.determine_birth_path_number(@birthdate)
	@message = Person.determine_message(bpn)
	erb :index
end

get '/message/:bpn' do 
	bpn = params[:bpn].to_i
	@message = Person.determine_message(bpn)
	erb :index
end

