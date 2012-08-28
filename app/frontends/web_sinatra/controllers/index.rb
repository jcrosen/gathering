
include UseCases

get '/' do
  haml :index
end

get '/gatherings' do
  @vm = ListGathering.new.exec
  haml :gatherings_index  #, :locals => @vm
end
