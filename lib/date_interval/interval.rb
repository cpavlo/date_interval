module DateInterval
  class Interval
    class Type
      DAY = 'day'
      WEEK = 'week'
      WEEK_AGO = 'week_ago'
      MONTH = 'month'
      MONTH_AGO = 'month_ago'
      YEAR = 'year'
      YEAR_AGO = 'year_ago'
      MANUAL = 'manual'
    end

    attr_reader :type

    def initialize(params, options = {})
      @type = (params[:interval] || options[:default_type] || Type::DAY).to_s.underscore
      @field = options[:field] || :date
      @manual_start = params[:from] ? params[:from].to_date : Date.today
      @manual_end = params[:to] ? params[:to].to_date : Date.today
    end

    def apply(scope)
      scope.where(@field => start_date..end_date)
    end

    def start_date
      date = case @type
               when Type::DAY then
                 Date.today
               when Type::WEEK then
                 Date.today.beginning_of_week
               when Type::WEEK_AGO then
                 Date.today - 1.week
               when Type::MONTH then
                 Date.today.beginning_of_month
               when Type::MONTH_AGO then
                 Date.today - 1.month
               when Type::YEAR then
                 Date.today.beginning_of_year
               when Type::YEAR_AGO then
                 Date.today - 1.year
               when Type::MANUAL then
                 @manual_start
             end
      date.beginning_of_day
    end

    def end_date
      date = case @type
               when Type::DAY then
                 Date.today
               when Type::WEEK then
                 Date.today.end_of_week
               when Type::WEEK_AGO then
                 Date.today
               when Type::MONTH then
                 Date.today.end_of_month
               when Type::MONTH_AGO then
                 Date.today
               when Type::YEAR then
                 Date.today.end_of_year
               when Type::YEAR_AGO then
                 Date.today
               when Type::MANUAL then
                 @manual_end
             end
      date.end_of_day
    end

  end
end