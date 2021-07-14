class Application
    def call(env)
      resp = Rack::Response.new
      req = Rack::Request.new(env)

    #   if path matches /events/
        if req.path.match(/events/) && req.get?
        # get all events objects with the appropriate attr labels
            events = Event.all.map do |event|
                {id: event.id, description: event.description, event_date: event.event_date, location: event.location}
            end

            # return the objects into json objects; {:events} = what is going to appear in browser, can be named whatever
            return [200, { 'Content-Type' => 'application/json' }, [ {:events => events}.to_json ]]   
        
        elsif req.path.match(/events/) && req.post?
            req.name
            new_doc = Event.create(name: req.params.name)
            # need to edit for functionality of post
            return [200, { 'Content-Type' => 'application/json' }, [ {:events => events}.to_json ]]  
        else

            resp.write "Path Not Found"
        end
        resp.finish
    end
end