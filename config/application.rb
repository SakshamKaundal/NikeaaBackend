require_relative "boot"

# Rails/ActiveSupport expects Ruby's Logger constant to be available.
require "logger"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Backend
  class Application < Rails::Application
    # `query_log_tags_enabled` and `query_log_tags` exist only in newer
    # ActiveRecord/Rails versions. Guard so the app boots on Rails 6.1.
    if defined?(ActiveRecord::Base) && ActiveRecord::Base.respond_to?(:query_log_tags_enabled=)
      config.active_record.query_log_tags_enabled = true
      config.active_record.query_log_tags = [
        # Rails query log tags:
        :application, :controller, :action, :job,
        # GraphQL-Ruby query log tags:
        current_graphql_operation: -> { GraphQL::Current.operation_name },
        current_graphql_field: -> { GraphQL::Current.field&.path },
        current_dataloader_source: -> { GraphQL::Current.dataloader_source_class },
      ]
    end
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
