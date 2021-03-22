class TyphoeusUtil < LogHandle

	#Using gem for http requests - once and batch process
	#https://github.com/typhoeus/typhoeus
	class << self

		def typhoeus(url)
      request = get_typhoeus_request(url)
      request.on_complete do |response|
        if response.success?
          info_ "We got response from url :#{url} / Response : #{response}" , __method__
          return response
        elsif response.timed_out?
          err_ "Response timed out", __method__
          return nil
        elsif response.code == 0
          err_ response.return_message, __method__
          return nil
        else
          err_ "HTTP request has failed - #{response.code} , Message : #{response.return_message}", __method__
          return nil
        end
      end
      request.run
    end

    #The execution of that code goes something like this. 
    #The first and second requests are built and queued. 
    #When hydra is run the first and second requests run in parallel. 
    #When the first request completes, the third request is then built and queued, in this example based on the result of the first request. 
    #The moment it is queued Hydra starts executing it. 
    #Meanwhile the second request would continue to run (or it could have completed before the first). 
    #Once the third request is done, hydra.run returns.
    def typhoeus_batch(urls)
      hydra = Typhoeus::Hydra.new(max_concurrency: 100)
      responses = []
      urls.each do |url|
        request = get_typhoeus_request(url)
        request.on_complete do |response|
          responses << response if response.success?
        end
        hydra.queue(request)
        request
      end
      hydra.run
      responses
    end

    def get_typhoeus_request(url)
      auth = "Basic " + Base64::strict_encode64("#{Constant::EMAIL}:#{Constant::TOKEN}")
      return Typhoeus::Request.new(
          url,
          method: 'GET',
          followlocation: true,
          headers: { 
            ContentType: "application/json", 
            Accept: "application/json",
            Authorization: auth
          }
        )
    end

	end

end