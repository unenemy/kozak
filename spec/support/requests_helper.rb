module Requests
  module JsonHelpers
    def json
      @json ||= JSON.parse(response.body, symbolize_names: true)
    end
  end

  module AuthHelpers
    def authWithToken(token)
      request.headers['X-ACCESS-TOKEN'] = "#{token.token}"
    end

    def clearToken
      request.headers['X-ACCESS-TOKEN'] = nil
    end
  end
end