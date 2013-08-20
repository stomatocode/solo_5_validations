get '/' do
  @events = Event.all
  erb :index
end

get '/events/:id/show' do |id|
  @event = Event.find(id)
  erb :event_show
end

get '/events/new' do


  # this is where I'll place a call to model to create a new 
  # event object
  #TODO IMPLEMENT ME
  erb :new
end

post '/events/create' do

p params
@new_event = Event.new(params)



  # this is where I'll implement the create method from AR
  # to write the event object to the database
  # my validations will occur before this post is allowed to 
  # execute
  #TODO IMPLEMENT ME
end


# review put statements sinatra