# typed: strong

module ModerationAPI
  module Models
    class ActionListParams < ModerationAPI::Internal::Type::BaseModel
      extend ModerationAPI::Internal::Type::RequestParameters::Converter
      include ModerationAPI::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            ModerationAPI::ActionListParams,
            ModerationAPI::Internal::AnyHash
          )
        end

      sig { returns(T.nilable(String)) }
      attr_reader :queue_id

      sig { params(queue_id: String).void }
      attr_writer :queue_id

      sig do
        params(
          queue_id: String,
          request_options: ModerationAPI::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(queue_id: nil, request_options: {})
      end

      sig do
        override.returns(
          { queue_id: String, request_options: ModerationAPI::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end
