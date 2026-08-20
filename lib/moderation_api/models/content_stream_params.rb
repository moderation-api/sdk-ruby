# frozen_string_literal: true

module ModerationAPI
  module Models
    # @see ModerationAPI::Resources::Content#stream
    class ContentStreamParams < ModerationAPI::Internal::Type::BaseModel
      extend ModerationAPI::Internal::Type::RequestParameters::Converter
      include ModerationAPI::Internal::Type::RequestParameters

      # @!attribute sec_web_socket_protocol
      #
      #   @return [Symbol, ModerationAPI::Models::ContentStreamParams::SecWebSocketProtocol]
      required :sec_web_socket_protocol, enum: -> { ModerationAPI::ContentStreamParams::SecWebSocketProtocol }

      # @!method initialize(sec_web_socket_protocol:, request_options: {})
      #   @param sec_web_socket_protocol [Symbol, ModerationAPI::Models::ContentStreamParams::SecWebSocketProtocol]
      #   @param request_options [ModerationAPI::RequestOptions, Hash{Symbol=>Object}]

      module SecWebSocketProtocol
        extend ModerationAPI::Internal::Type::Enum

        MODERATIONAPI_V1 = :"moderationapi.v1"

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
