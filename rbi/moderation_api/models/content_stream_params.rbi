# typed: strong

module ModerationAPI
  module Models
    class ContentStreamParams < ModerationAPI::Internal::Type::BaseModel
      extend ModerationAPI::Internal::Type::RequestParameters::Converter
      include ModerationAPI::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            ModerationAPI::ContentStreamParams,
            ModerationAPI::Internal::AnyHash
          )
        end

      sig do
        returns(
          ModerationAPI::ContentStreamParams::SecWebSocketProtocol::OrSymbol
        )
      end
      attr_accessor :sec_web_socket_protocol

      sig do
        params(
          sec_web_socket_protocol:
            ModerationAPI::ContentStreamParams::SecWebSocketProtocol::OrSymbol,
          request_options: ModerationAPI::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(sec_web_socket_protocol:, request_options: {})
      end

      sig do
        override.returns(
          {
            sec_web_socket_protocol:
              ModerationAPI::ContentStreamParams::SecWebSocketProtocol::OrSymbol,
            request_options: ModerationAPI::RequestOptions
          }
        )
      end
      def to_hash
      end

      module SecWebSocketProtocol
        extend ModerationAPI::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(
              Symbol,
              ModerationAPI::ContentStreamParams::SecWebSocketProtocol
            )
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        MODERATIONAPI_V1 =
          T.let(
            :"moderationapi.v1",
            ModerationAPI::ContentStreamParams::SecWebSocketProtocol::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              ModerationAPI::ContentStreamParams::SecWebSocketProtocol::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
