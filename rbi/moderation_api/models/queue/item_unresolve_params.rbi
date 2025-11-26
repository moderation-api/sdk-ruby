# typed: strong

module ModerationAPI
  module Models
    module Queue
      class ItemUnresolveParams < ModerationAPI::Internal::Type::BaseModel
        extend ModerationAPI::Internal::Type::RequestParameters::Converter
        include ModerationAPI::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              ModerationAPI::Queue::ItemUnresolveParams,
              ModerationAPI::Internal::AnyHash
            )
          end

        # The queue ID
        sig { returns(String) }
        attr_accessor :id

        # Optional reason for unresolving the item
        sig { returns(T.nilable(String)) }
        attr_reader :comment

        sig { params(comment: String).void }
        attr_writer :comment

        sig do
          params(
            id: String,
            comment: String,
            request_options: ModerationAPI::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # The queue ID
          id:,
          # Optional reason for unresolving the item
          comment: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              id: String,
              comment: String,
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
