module DateInterval
  class Engine < ::Rails::Engine
    isolate_namespace DateInterval
    initializer 'date_interval.action_controller' do |app|
      ActiveSupport.on_load :action_controller do
        helper DateInterval::ApplicationHelper
      end
      ActiveSupport.on_load :active_record do
        ActiveRecord::Base.include(Dated)
      end
    end
  end
end
