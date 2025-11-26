# typed: strong

module ModerationAPI
  module Models
    module Actions
      class ExecuteExecuteParams < ModerationAPI::Internal::Type::BaseModel
        extend ModerationAPI::Internal::Type::RequestParameters::Converter
        include ModerationAPI::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              ModerationAPI::Actions::ExecuteExecuteParams,
              ModerationAPI::Internal::AnyHash
            )
          end

        # ID or key of the action to execute
        sig { returns(String) }
        attr_accessor :action_key

        # IDs of the authors to apply the action to. Provide this or contentIds.
        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :author_ids

        sig { params(author_ids: T::Array[String]).void }
        attr_writer :author_ids

        # IDs of the content items to apply the action to. Provide this or authorIds.
        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :content_ids

        sig { params(content_ids: T::Array[String]).void }
        attr_writer :content_ids

        # Optional duration in milliseconds for actions with timeouts
        sig { returns(T.nilable(Float)) }
        attr_reader :duration

        sig { params(duration: Float).void }
        attr_writer :duration

        # Optional queue ID if the action is queue-specific
        sig { returns(T.nilable(String)) }
        attr_reader :queue_id

        sig { params(queue_id: String).void }
        attr_writer :queue_id

        # Optional value to provide with the action
        sig { returns(T.nilable(String)) }
        attr_reader :value

        sig { params(value: String).void }
        attr_writer :value

        sig do
          params(
            action_key: String,
            author_ids: T::Array[String],
            content_ids: T::Array[String],
            duration: Float,
            queue_id: String,
            value: String,
            request_options: ModerationAPI::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # ID or key of the action to execute
          action_key:,
          # IDs of the authors to apply the action to. Provide this or contentIds.
          author_ids: nil,
          # IDs of the content items to apply the action to. Provide this or authorIds.
          content_ids: nil,
          # Optional duration in milliseconds for actions with timeouts
          duration: nil,
          # Optional queue ID if the action is queue-specific
          queue_id: nil,
          # Optional value to provide with the action
          value: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              action_key: String,
              author_ids: T::Array[String],
              content_ids: T::Array[String],
              duration: Float,
              queue_id: String,
              value: String,
              request_options: ModerationAPI::RequestOptions
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
