class Service::Depending < Service
  string :token

  url "http://depending.in/"

  maintained_by :github => 'toopay'

  def receive_push
    http.ssl[:verify] = false
    http.basic_auth "github", token
    http_post "http://depending.in/hook", :payload => payload.to_json
  end

  def token
    data["token"].to_s.strip
  end

end
