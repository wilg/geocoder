require 'geocoder/lookups/base'
require 'geocoder/results/ip_api'

module Geocoder::Lookup
  class IpApi < Base

    def name
      "IP-API.com"
    end

    def query_url(query)
      "http://ip-api.com/json/#{query.sanitized_text}"
    end

    private

    def results(query)
      return [] unless doc = fetch_data(query)
      return [] if doc['status'] == 'fail'
      return [doc]
    end

  end
end
