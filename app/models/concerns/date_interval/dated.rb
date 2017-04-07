module DateInterval
  module Dated
    extend ActiveSupport::Concern
    included do
      def self.by_date_interval(params, options = {})
        @date_interval = Interval.new(params, options)
        @date_interval.apply(self)
      end

      def self.date_interval
        @date_interval
      end
    end
  end
end