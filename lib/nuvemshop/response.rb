module Nuvemshop
  class Response < Object
    attr_reader :response, :body, :code, :headers, :parsed_response

    def initialize(response)
      @response = response
      @code = response.code
      @body = response.body
      @headers = response.headers
      @parsed_response = response.parsed_response
    end

    def to_s
      if !response.nil? && !response.body.nil? && response.body.respond_to?(:to_s)
        response.body.to_s
      else
        inspect
      end
    end

    def inspect
      inspect_id = ::Kernel.format '%x', (object_id * 2)
      %(#<#{self.class}:0x#{inspect_id} code, @response=#{response.inspect}, @headers=#{headers.inspect}>)
    end

    def pretty_print(pp)
      if !parsed_response.nil? && parsed_response.respond_to?(:pretty_print)
        parsed_response.pretty_print(pp)
      else
        super
      end
    end

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
