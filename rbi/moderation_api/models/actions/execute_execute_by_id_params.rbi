# typed: strong

module ModerationAPI
  module Models
    module Actions
      class ExecuteExecuteByIDParams < ModerationAPI::Internal::Type::BaseModel
        extend ModerationAPI::Internal::Type::RequestParameters::Converter
        include ModerationAPI::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              ModerationAPI::Actions::ExecuteExecuteByIDParams,
              ModerationAPI::Internal::AnyHash
            )
          end

        # IDs of the authors to apply the action to
        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :author_ids

        sig { params(author_ids: T::Array[String]).void }
        attr_writer :author_ids

        # The IDs of the content items to perform the action on.
        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :content_ids

        sig { params(content_ids: T::Array[String]).void }
        attr_writer :content_ids

        # The ID of the queue the action was performed from if any.
        sig { returns(T.nilable(String)) }
        attr_reader :queue_id

        sig { params(queue_id: String).void }
        attr_writer :queue_id

        # The value of the action. Useful to set a reason for the action etc.
        sig { returns(T.nilable(String)) }
        attr_reader :value

        sig { params(value: String).void }
        attr_writer :value

        sig do
          params(
            author_ids: T::Array[String],
            content_ids: T::Array[String],
            queue_id: String,
            value: String,
            request_options: ModerationAPI::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # IDs of the authors to apply the action to
          author_ids: nil,
          # The IDs of the content items to perform the action on.
          content_ids: nil,
          # The ID of the queue the action was performed from if any.
          queue_id: nil,
          # The value of the action. Useful to set a reason for the action etc.
          value: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              author_ids: T::Array[String],
              content_ids: T::Array[String],
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
