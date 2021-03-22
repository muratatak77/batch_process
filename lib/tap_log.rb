class TapLog

  LOGGER ||= ActiveSupport::TaggedLogging.new(ActiveSupport::Logger.new("log/development.log"))
  LOGGER2 ||= ActiveSupport::TaggedLogging.new(ActiveSupport::Logger.new(STDOUT))

  class  << self
    
    def info(message, options={})
      log = common_info(message, options)
      log_res = {
        MSG: message,
        DET: log.to_json,
      }
      LOGGER.info(log_res)
      LOGGER2.info(log_res)
    end

    def warning(message, options={})
      log = common_info(message, options)
      if log.present?
        LOGGER.warn(log.to_json)
        LOGGER2.warn(log.to_json)
      end
    end

    def error(message, options={})
      log = common_info(message, options)
      if log.present?
        LOGGER.error(log.to_json)
        LOGGER2.error(log.to_json)
      end
    end

    private

    def common_info(message, options)
      log = {}
      log[:message] = message
      log[:method] = options[:method] if options[:method].present?
      log
    end

  end

end
