# typed: strong

module ModerationAPI
  module Models
    class QueueGetStatsParams < ModerationAPI::Internal::Type::BaseModel
      extend ModerationAPI::Internal::Type::RequestParameters::Converter
      include ModerationAPI::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            ModerationAPI::QueueGetStatsParams,
            ModerationAPI::Internal::AnyHash
          )
        end

      # Number of days to analyze statistics for
      sig { returns(T.nilable(String)) }
      attr_reader :within_days

      sig { params(within_days: String).void }
      attr_writer :within_days

      sig do
        params(
          within_days: String,
          request_options: ModerationAPI::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Number of days to analyze statistics for
        within_days: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            within_days: String,
            request_options: ModerationAPI::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
