module ShiftPlanning
  class Client
    include HTTParty
    base_uri "https://www.shiftplanning.com/api"
    attr_reader :key, :username, :password, :token

    def initialize(key, username, password)
      @key = key
      @username = username
      @password = password
      @token = get_token
    end

    def get(api_module, data= {})
      request("GET", api_module, data)
    end

    def update(api_module, data= {})
      request("UPDATE", api_module, data)
    end

    def create(api_module, data= {})
      request("CREATE", api_module, data)
    end

    def delete(api_module, data= {})
      request("DELETE", api_module, data)
    end

    #Time-saving api requests
    def shifts(data = {})
      request("GET", "schedule.shifts", data)
    end

  private
    def request(method, api_module, data = {})
      response(request_options(method, api_module, data))
    end

    def response(options)
      JSON.parse(self.class.post("/", options))
    end

    def get_token
      response = response(auth_options)
      if response && is_ok?(response)
        response["token"]
      else
        raise "API authentication failed. Please check your key, username and password."
      end
    end

    def auth_options
      options({
        "key" => key,
        "request" => {
          "module" => "staff.login",
          "method" => "GET",
          "username" => username,
          "password" => password
        }
      })
    end

    def request_options(method, api_module, data)
      token ||= get_token
      options({
        "method" => method,
        "module" => api_module,
        "request" => data.merge({"token" => token, "mode" => "overview"})
      })
    end

    def options(body)
      {
        headers: {
          "Content-Type" => "application/x-www-form-urlencoded"
        },
        body: "data=#{body.to_json}"
      }
    end

    def is_ok?(response)
      response["status"] == 1
    end

  end
end
