class RestUtil < LogHandle

  class << self

    def run(url_s, is_batch: false)
      info_ "RestUtil Calling with - Initial URL : #{url_s}"
      if is_batch
        response = TyphoeusUtil.typhoeus_batch(url_s)
      else
        url = Constant::CORE_URL + url_s
        response = TyphoeusUtil.typhoeus(url)
      end
      if response.present?
        return get_data(response) unless is_batch
        return get_datas(response) if is_batch
      end
      return nil
    end

    private 

    def get_data(response)
      json_parse(response)
    end

    def get_datas(responses)
      result = []
      responses.each do |res|
        result << json_parse(res)
      end
      result
    end

    def json_parse(res)
      JSON.parse(res.body)
    end

  end

end