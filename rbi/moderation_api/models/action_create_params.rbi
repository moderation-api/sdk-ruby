# typed: strong

module ModerationAPI
  module Models
    class ActionCreateParams < ModerationAPI::Internal::Type::BaseModel
      extend ModerationAPI::Internal::Type::RequestParameters::Converter
      include ModerationAPI::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            ModerationAPI::ActionCreateParams,
            ModerationAPI::Internal::AnyHash
          )
        end

      # The name of the action.
      sig { returns(String) }
      attr_accessor :name

      # Whether the action is a built-in action or a custom one.
      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :built_in

      # The description of the action.
      sig { returns(T.nilable(String)) }
      attr_accessor :description

      # The IDs of the queues the action is available in.
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :filter_in_queue_ids

      sig { params(filter_in_queue_ids: T::Array[String]).void }
      attr_writer :filter_in_queue_ids

      # Whether the action allows any text to be entered as a value or if it must be one
      # of the possible values.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :free_text

      sig { params(free_text: T::Boolean).void }
      attr_writer :free_text

      # User defined key of the action.
      sig { returns(T.nilable(String)) }
      attr_accessor :key

      # Show the action in all queues, selected queues or no queues (to use via API
      # only).
      sig do
        returns(
          T.nilable(ModerationAPI::ActionCreateParams::Position::OrSymbol)
        )
      end
      attr_reader :position

      sig do
        params(
          position: ModerationAPI::ActionCreateParams::Position::OrSymbol
        ).void
      end
      attr_writer :position

      # The possible values of the action. The user will be prompted to select one of
      # these values when executing the action.
      sig do
        returns(
          T.nilable(T::Array[ModerationAPI::ActionCreateParams::PossibleValue])
        )
      end
      attr_reader :possible_values

      sig do
        params(
          possible_values:
            T::Array[ModerationAPI::ActionCreateParams::PossibleValue::OrHash]
        ).void
      end
      attr_writer :possible_values

      # Whether the action resolves and removes the item, unresolves and re-add it to
      # the queue, or does not change the resolve status.
      sig do
        returns(
          T.nilable(ModerationAPI::ActionCreateParams::QueueBehaviour::OrSymbol)
        )
      end
      attr_reader :queue_behaviour

      sig do
        params(
          queue_behaviour:
            ModerationAPI::ActionCreateParams::QueueBehaviour::OrSymbol
        ).void
      end
      attr_writer :queue_behaviour

      # The type of the action.
      sig do
        returns(T.nilable(ModerationAPI::ActionCreateParams::Type::OrSymbol))
      end
      attr_accessor :type

      # Whether the action requires a value to be executed.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :value_required

      sig { params(value_required: T::Boolean).void }
      attr_writer :value_required

      # The action's webhooks.
      sig do
        returns(T.nilable(T::Array[ModerationAPI::ActionCreateParams::Webhook]))
      end
      attr_reader :webhooks

      sig do
        params(
          webhooks: T::Array[ModerationAPI::ActionCreateParams::Webhook::OrHash]
        ).void
      end
      attr_writer :webhooks

      sig do
        params(
          name: String,
          built_in: T.nilable(T::Boolean),
          description: T.nilable(String),
          filter_in_queue_ids: T::Array[String],
          free_text: T::Boolean,
          key: T.nilable(String),
          position: ModerationAPI::ActionCreateParams::Position::OrSymbol,
          possible_values:
            T::Array[ModerationAPI::ActionCreateParams::PossibleValue::OrHash],
          queue_behaviour:
            ModerationAPI::ActionCreateParams::QueueBehaviour::OrSymbol,
          type: T.nilable(ModerationAPI::ActionCreateParams::Type::OrSymbol),
          value_required: T::Boolean,
          webhooks:
            T::Array[ModerationAPI::ActionCreateParams::Webhook::OrHash],
          request_options: ModerationAPI::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The name of the action.
        name:,
        # Whether the action is a built-in action or a custom one.
        built_in: nil,
        # The description of the action.
        description: nil,
        # The IDs of the queues the action is available in.
        filter_in_queue_ids: nil,
        # Whether the action allows any text to be entered as a value or if it must be one
        # of the possible values.
        free_text: nil,
        # User defined key of the action.
        key: nil,
        # Show the action in all queues, selected queues or no queues (to use via API
        # only).
        position: nil,
        # The possible values of the action. The user will be prompted to select one of
        # these values when executing the action.
        possible_values: nil,
        # Whether the action resolves and removes the item, unresolves and re-add it to
        # the queue, or does not change the resolve status.
        queue_behaviour: nil,
        # The type of the action.
        type: nil,
        # Whether the action requires a value to be executed.
        value_required: nil,
        # The action's webhooks.
        webhooks: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            name: String,
            built_in: T.nilable(T::Boolean),
            description: T.nilable(String),
            filter_in_queue_ids: T::Array[String],
            free_text: T::Boolean,
            key: T.nilable(String),
            position: ModerationAPI::ActionCreateParams::Position::OrSymbol,
            possible_values:
              T::Array[ModerationAPI::ActionCreateParams::PossibleValue],
            queue_behaviour:
              ModerationAPI::ActionCreateParams::QueueBehaviour::OrSymbol,
            type: T.nilable(ModerationAPI::ActionCreateParams::Type::OrSymbol),
            value_required: T::Boolean,
            webhooks: T::Array[ModerationAPI::ActionCreateParams::Webhook],
            request_options: ModerationAPI::RequestOptions
          }
        )
      end
      def to_hash
      end

      # Show the action in all queues, selected queues or no queues (to use via API
      # only).
      module Position
        extend ModerationAPI::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, ModerationAPI::ActionCreateParams::Position)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ALL_QUEUES =
          T.let(
            :ALL_QUEUES,
            ModerationAPI::ActionCreateParams::Position::TaggedSymbol
          )
        SOME_QUEUES =
          T.let(
            :SOME_QUEUES,
            ModerationAPI::ActionCreateParams::Position::TaggedSymbol
          )
        HIDDEN =
          T.let(
            :HIDDEN,
            ModerationAPI::ActionCreateParams::Position::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[ModerationAPI::ActionCreateParams::Position::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      class PossibleValue < ModerationAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ModerationAPI::ActionCreateParams::PossibleValue,
              ModerationAPI::Internal::AnyHash
            )
          end

        # The value of the action.
        sig { returns(String) }
        attr_accessor :value

        sig { params(value: String).returns(T.attached_class) }
        def self.new(
          # The value of the action.
          value:
        )
        end

        sig { override.returns({ value: String }) }
        def to_hash
        end
      end

      # Whether the action resolves and removes the item, unresolves and re-add it to
      # the queue, or does not change the resolve status.
      module QueueBehaviour
        extend ModerationAPI::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, ModerationAPI::ActionCreateParams::QueueBehaviour)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        REMOVE =
          T.let(
            :REMOVE,
            ModerationAPI::ActionCreateParams::QueueBehaviour::TaggedSymbol
          )
        ADD =
          T.let(
            :ADD,
            ModerationAPI::ActionCreateParams::QueueBehaviour::TaggedSymbol
          )
        NO_CHANGE =
          T.let(
            :NO_CHANGE,
            ModerationAPI::ActionCreateParams::QueueBehaviour::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              ModerationAPI::ActionCreateParams::QueueBehaviour::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end

      # The type of the action.
      module Type
        extend ModerationAPI::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, ModerationAPI::ActionCreateParams::Type)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        AUTHOR_BLOCK =
          T.let(
            :AUTHOR_BLOCK,
            ModerationAPI::ActionCreateParams::Type::TaggedSymbol
          )
        AUTHOR_BLOCK_TEMP =
          T.let(
            :AUTHOR_BLOCK_TEMP,
            ModerationAPI::ActionCreateParams::Type::TaggedSymbol
          )
        AUTHOR_UNBLOCK =
          T.let(
            :AUTHOR_UNBLOCK,
            ModerationAPI::ActionCreateParams::Type::TaggedSymbol
          )
        AUTHOR_DELETE =
          T.let(
            :AUTHOR_DELETE,
            ModerationAPI::ActionCreateParams::Type::TaggedSymbol
          )
        AUTHOR_REPORT =
          T.let(
            :AUTHOR_REPORT,
            ModerationAPI::ActionCreateParams::Type::TaggedSymbol
          )
        AUTHOR_WARN =
          T.let(
            :AUTHOR_WARN,
            ModerationAPI::ActionCreateParams::Type::TaggedSymbol
          )
        AUTHOR_CUSTOM =
          T.let(
            :AUTHOR_CUSTOM,
            ModerationAPI::ActionCreateParams::Type::TaggedSymbol
          )
        ITEM_REJECT =
          T.let(
            :ITEM_REJECT,
            ModerationAPI::ActionCreateParams::Type::TaggedSymbol
          )
        ITEM_ALLOW =
          T.let(
            :ITEM_ALLOW,
            ModerationAPI::ActionCreateParams::Type::TaggedSymbol
          )
        ITEM_CUSTOM =
          T.let(
            :ITEM_CUSTOM,
            ModerationAPI::ActionCreateParams::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[ModerationAPI::ActionCreateParams::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      class Webhook < ModerationAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ModerationAPI::ActionCreateParams::Webhook,
              ModerationAPI::Internal::AnyHash
            )
          end

        # The webhook's name, used to identify it in the dashboard
        sig { returns(String) }
        attr_accessor :name

        # The webhook's URL. We'll call this URL when the event occurs.
        sig { returns(String) }
        attr_accessor :url

        # ID of an existing webhook or undefined if this is a new webhook.
        sig { returns(T.nilable(String)) }
        attr_reader :id

        sig { params(id: String).void }
        attr_writer :id

        # The webhook's description
        sig { returns(T.nilable(String)) }
        attr_accessor :description

        sig do
          params(
            name: String,
            url: String,
            id: String,
            description: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(
          # The webhook's name, used to identify it in the dashboard
          name:,
          # The webhook's URL. We'll call this URL when the event occurs.
          url:,
          # ID of an existing webhook or undefined if this is a new webhook.
          id: nil,
          # The webhook's description
          description: nil
        )
        end

        sig do
          override.returns(
            {
              name: String,
              url: String,
              id: String,
              description: T.nilable(String)
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
