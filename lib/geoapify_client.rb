module GeoapifyClient
    class << self
        def connection
            connection ||= Faraday.new(
                url: 'https://api.geoapify.com/',
                params: { apiKey: ENV.fetch('GEOAPIFY_KEY') },
                headers: { 'Content-Type' => 'application/json' }
            )
        end
    end
end