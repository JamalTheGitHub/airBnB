module Filterable
  extend ActiveSupport::Concern

  module ClassMethods
    def filter(listing_params)
      results = self.where(nil)
      listing_params.each do |key, value|
        results = results.public_send(key, value) if value.present?
      end
      results
    end
  end
end