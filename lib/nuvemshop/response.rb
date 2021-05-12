module Nuvemshop
  class Response < Object
    attr_reader :response, :body, :code, :headers, :parsed_response, :formatter

    def initialize(response, formatter = nil)
      @response = response
      @code = response.code
      @body = response.body
      @headers = response.headers
      @parsed_response = response.parsed_response
      @formatter = formatter
    end

    # Formats response with desired class
    def format
      return unless formatter

      @parsed_response = if parsed_response.is_a?(Array)
                           parsed_response.map { |pr| formatter.new(pr) }
                         else
                           formatter.new(parsed_response)
                         end
    end

    # Defines default value of class with response.body
    def to_s
      if !response.nil? && !response.body.nil? && response.body.respond_to?(:to_s)
        response.body.to_s
      else
        inspect
      end
    end

    # Redefines default pretty_print showing response as output
    def pretty_print(pp)
      format

      if !parsed_response.nil? && parsed_response.respond_to?(:pretty_print)
        parsed_response.pretty_print(pp)
      else
        super
      end
    end

    # Checks if responds to missing method
    def respond_to_missing?(name, *args)
      return true if super

      parsed_response.respond_to?(name) || response.respond_to?(name)
    end

    protected

      def method_missing(name, *args, &block)
        if parsed_response.respond_to?(name)
          parsed_response.send(name, *args, &block)
        elsif response.respond_to?(name)
          response.send(name, *args, &block)
        else
          super
        end
      end
  end
end
