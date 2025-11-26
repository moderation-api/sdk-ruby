# typed: strong

module ModerationAPI
  module Models
    class WordlistRetrieveParams < ModerationAPI::Internal::Type::BaseModel
      extend ModerationAPI::Internal::Type::RequestParameters::Converter
      include ModerationAPI::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            ModerationAPI::WordlistRetrieveParams,
            ModerationAPI::Internal::AnyHash
          )
        end

      sig do
        params(request_options: ModerationAPI::RequestOptions::OrHash).returns(
          T.attached_class
        )
      end
      def self.new(request_options: {})
      end

      sig do
        override.returns({ request_options: ModerationAPI::RequestOptions })
      end
      def to_hash
      end
    end
  end
end
