module Shopping
  class ServiceError < StandardError
    delegate :as_json, to: :data

    attr :data
    def initialize object
      @errors = object.errors
      @data = {}
      @errors.messages.each { |k,v| @data[k] = v.to_sentence }
    end

    def message
      messages = []
      @errors.messages.each do |k, v|
        v.each do |m|
          messages << "#{k if k != :base} #{m}"
        end
      end
      messages.to_sentence.strip.capitalize
    end
    alias_method :to_s, :message
  end
end