module JsonRequests
  module JsonHelpers
    def json
      @json ||= JSON.parse(resonse.body)
    end
  end
end    
