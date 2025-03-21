# frozen_string_literal: true

require "sidekiq"

::Sidekiq.configure_server do |config|
  config.error_handlers << proc do |ex, context|
    ExceptionNotifier.notify_exception(ex, data: {sidekiq: context})
  end
end
