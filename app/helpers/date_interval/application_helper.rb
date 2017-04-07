module DateInterval
  module ApplicationHelper
    def render_date_interval_for(dated)
      render partial: 'controls/date_interval/interval', locals: {interval: dated.date_interval}
    end
  end
end
