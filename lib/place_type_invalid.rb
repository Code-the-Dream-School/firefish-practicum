class PlaceTypeInvalid < StandardError
    attr_accessor :message

    def initialize(message)
        @message = message
    end

    def to_s
        "[#{message}] #{super}"
    end
end