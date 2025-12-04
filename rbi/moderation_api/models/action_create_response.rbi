# typed: strong

module ModerationAPI
  module Models
    class ActionCreateResponse < ModerationAPI::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            ModerationAPI::Models::ActionCreateResponse,
            ModerationAPI::Internal::AnyHash
          )
        end

      # The ID of the action.
      sig { returns(String) }
      attr_accessor :id

      # Whether the action is a built-in action or a custom one.
      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :built_in

      # The date the action was created.
      sig { returns(String) }
      attr_accessor :created_at

      # The IDs of the queues the action is available in.
      sig { returns(T::Array[String]) }
      attr_accessor :filter_in_queue_ids

      # Whether the action allows any text to be entered as a value or if it must be one
      # of the possible values.
      sig { returns(T::Boolean) }
      attr_accessor :free_text

      # The name of the action.
      sig { returns(String) }
      attr_accessor :name

      # Show the action in all queues, selected queues or no queues (to use via API
      # only).
      sig do
        returns(
          ModerationAPI::Models::ActionCreateResponse::Position::TaggedSymbol
        )
      end
      attr_accessor :position

      # The possible values of the action. The user will be prompted to select one of
      # these values when executing the action.
      sig do
        returns(
          T::Array[ModerationAPI::Models::ActionCreateResponse::PossibleValue]
        )
      end
      attr_accessor :possible_values

      # Whether the action resolves and removes the item, unresolves and re-add it to
      # the queue, or does not change the resolve status.
      sig do
        returns(
          ModerationAPI::Models::ActionCreateResponse::QueueBehaviour::TaggedSymbol
        )
      end
      attr_accessor :queue_behaviour

      # Whether the action requires a value to be executed.
      sig { returns(T::Boolean) }
      attr_accessor :value_required

      # The description of the action.
      sig { returns(T.nilable(String)) }
      attr_accessor :description

      # User defined key of the action.
      sig { returns(T.nilable(String)) }
      attr_accessor :key

      # The type of the action.
      sig do
        returns(
          T.nilable(
            ModerationAPI::Models::ActionCreateResponse::Type::TaggedSymbol
          )
        )
      end
      attr_accessor :type

      sig do
        params(
          id: String,
          built_in: T.nilable(T::Boolean),
          created_at: String,
          filter_in_queue_ids: T::Array[String],
          free_text: T::Boolean,
          name: String,
          position:
            ModerationAPI::Models::ActionCreateResponse::Position::OrSymbol,
          possible_values:
            T::Array[
              ModerationAPI::Models::ActionCreateResponse::PossibleValue::OrHash
            ],
          queue_behaviour:
            ModerationAPI::Models::ActionCreateResponse::QueueBehaviour::OrSymbol,
          value_required: T::Boolean,
          description: T.nilable(String),
          key: T.nilable(String),
          type:
            T.nilable(
              ModerationAPI::Models::ActionCreateResponse::Type::OrSymbol
            )
        ).returns(T.attached_class)
      end
      def self.new(
        # The ID of the action.
        id:,
        # Whether the action is a built-in action or a custom one.
        built_in:,
        # The date the action was created.
        created_at:,
        # The IDs of the queues the action is available in.
        filter_in_queue_ids:,
        # Whether the action allows any text to be entered as a value or if it must be one
        # of the possible values.
        free_text:,
        # The name of the action.
        name:,
        # Show the action in all queues, selected queues or no queues (to use via API
        # only).
        position:,
        # The possible values of the action. The user will be prompted to select one of
        # these values when executing the action.
        possible_values:,
        # Whether the action resolves and removes the item, unresolves and re-add it to
        # the queue, or does not change the resolve status.
        queue_behaviour:,
        # Whether the action requires a value to be executed.
        value_required:,
        # The description of the action.
        description: nil,
        # User defined key of the action.
        key: nil,
        # The type of the action.
        type: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            built_in: T.nilable(T::Boolean),
            created_at: String,
            filter_in_queue_ids: T::Array[String],
            free_text: T::Boolean,
            name: String,
            position:
              ModerationAPI::Models::ActionCreateResponse::Position::TaggedSymbol,
            possible_values:
              T::Array[
                ModerationAPI::Models::ActionCreateResponse::PossibleValue
              ],
            queue_behaviour:
              ModerationAPI::Models::ActionCreateResponse::QueueBehaviour::TaggedSymbol,
            value_required: T::Boolean,
            description: T.nilable(String),
            key: T.nilable(String),
            type:
              T.nilable(
                ModerationAPI::Models::ActionCreateResponse::Type::TaggedSymbol
              )
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
            T.all(Symbol, ModerationAPI::Models::ActionCreateResponse::Position)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ALL_QUEUES =
          T.let(
            :ALL_QUEUES,
            ModerationAPI::Models::ActionCreateResponse::Position::TaggedSymbol
          )
        SOME_QUEUES =
          T.let(
            :SOME_QUEUES,
            ModerationAPI::Models::ActionCreateResponse::Position::TaggedSymbol
          )
        HIDDEN =
          T.let(
            :HIDDEN,
            ModerationAPI::Models::ActionCreateResponse::Position::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              ModerationAPI::Models::ActionCreateResponse::Position::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end

      class PossibleValue < ModerationAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ModerationAPI::Models::ActionCreateResponse::PossibleValue,
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
            T.all(
              Symbol,
              ModerationAPI::Models::ActionCreateResponse::QueueBehaviour
            )
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        REMOVE =
          T.let(
            :REMOVE,
            ModerationAPI::Models::ActionCreateResponse::QueueBehaviour::TaggedSymbol
          )
        ADD =
          T.let(
            :ADD,
            ModerationAPI::Models::ActionCreateResponse::QueueBehaviour::TaggedSymbol
          )
        NO_CHANGE =
          T.let(
            :NO_CHANGE,
            ModerationAPI::Models::ActionCreateResponse::QueueBehaviour::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              ModerationAPI::Models::ActionCreateResponse::QueueBehaviour::TaggedSymbol
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
            T.all(Symbol, ModerationAPI::Models::ActionCreateResponse::Type)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        AUTHOR_BLOCK =
          T.let(
            :AUTHOR_BLOCK,
            ModerationAPI::Models::ActionCreateResponse::Type::TaggedSymbol
          )
        AUTHOR_BLOCK_TEMP =
          T.let(
            :AUTHOR_BLOCK_TEMP,
            ModerationAPI::Models::ActionCreateResponse::Type::TaggedSymbol
          )
        AUTHOR_UNBLOCK =
          T.let(
            :AUTHOR_UNBLOCK,
            ModerationAPI::Models::ActionCreateResponse::Type::TaggedSymbol
          )
        AUTHOR_DELETE =
          T.let(
            :AUTHOR_DELETE,
            ModerationAPI::Models::ActionCreateResponse::Type::TaggedSymbol
          )
        AUTHOR_REPORT =
          T.let(
            :AUTHOR_REPORT,
            ModerationAPI::Models::ActionCreateResponse::Type::TaggedSymbol
          )
        AUTHOR_WARN =
          T.let(
            :AUTHOR_WARN,
            ModerationAPI::Models::ActionCreateResponse::Type::TaggedSymbol
          )
        AUTHOR_CUSTOM =
          T.let(
            :AUTHOR_CUSTOM,
            ModerationAPI::Models::ActionCreateResponse::Type::TaggedSymbol
          )
        ITEM_REJECT =
          T.let(
            :ITEM_REJECT,
            ModerationAPI::Models::ActionCreateResponse::Type::TaggedSymbol
          )
        ITEM_ALLOW =
          T.let(
            :ITEM_ALLOW,
            ModerationAPI::Models::ActionCreateResponse::Type::TaggedSymbol
          )
        ITEM_CUSTOM =
          T.let(
            :ITEM_CUSTOM,
            ModerationAPI::Models::ActionCreateResponse::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              ModerationAPI::Models::ActionCreateResponse::Type::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
