module Shopping
  class BaseService
    include ActiveModel::Validations

    def initialize
      # use @var syntax for all getting/setting
    end

    def to_hash
      raise "Implement to_hash in your own damn service!"
    end

    def perform!
      raise "Implement perform! in your own damn service!"
    end

    def validate!
      raise Shopping::ServiceError.new(self) unless valid?
    end

    def log exception=nil
      output = []
      output = to_hash.map {|k,v| "#{k}='#{v}'" } if to_hash.present?
      output << "#{exception.message}"
      output.compact.join(' ')
    end

    def perform
      begin
        perform!
      rescue => e
        Rails.logger.error "[#{self.class.name}] #{log(e)}"
        return false
      end
      true
    end
  end
end
