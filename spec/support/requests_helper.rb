module Requests
  module JsonHelpers
    def json
      @json ||= JSON.parse(response.body, symbolize_names: true)
    end
  end

  module AuthHelpers
    def authorizing_user
      @user ||= create(:user)
    end

    def authorizing_headers
      token = authorizing_user.tokens.create.token
      { 'Authorization' => "Token token=\"#{token}\"" }
    end

    def authorized_request(method, path, params=nil)
      send(method, path, params, authorizing_headers)
    end
  end
end