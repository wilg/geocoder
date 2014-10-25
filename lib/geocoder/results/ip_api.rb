require 'geocoder/results/base'

module Geocoder::Result
  class IpApi < Base

    def address(format = :full)
      s = state_code.to_s == "" ? "" : ", #{state_code}"
      "#{city}#{s} #{postal_code}, #{country}".sub(/^[ ,]*/, "")
    end

    def coordinates
      [@data['lat'].to_f, @data['lon'].to_f]
    end

    def city
      @data['city']
    end

    def state
      @data['regionName']
    end

    def state_code
      @data['region']
    end

    def country
      @data['country']
    end

    def country_code
      @data['countryCode']
    end

    def postal_code
      @data['zip']
    end

    def self.response_attributes
      %w[as timezone isp org]
    end

    response_attributes.each do |a|
      define_method a do
        @data[a]
      end
    end

  end
end
