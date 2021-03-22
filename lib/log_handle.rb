class LogHandle

	class << self
	
	  def info_(message, method= nil)
	    TapLog.info(message, {method: method})
	  end

	  def warn_(message)
	    TapLog.warning(message, {method: method} )
	  end

	  def err_(message, method= nil)
	    TapLog.error(message, {method: method} )
	  end
	end
  
end