# frozen_string_literal: true

module ModerationAPI
  module Models
    # @see ModerationAPI::Resources::Actions#update
    class ActionUpdateParams < ModerationAPI::Internal::Type::BaseModel
      extend ModerationAPI::Internal::Type::RequestParameters::Converter
      include ModerationAPI::Internal::Type::RequestParameters

      # @!attribute built_in
      #   Whether the action is a built-in action or a custom one.
      #
      #   @return [Boolean, nil]
      optional :built_in, ModerationAPI::Internal::Type::Boolean, api_name: :builtIn, nil?: true

      # @!attribute description
      #   The description of the action.
      #
      #   @return [String, nil]
      optional :description, String, nil?: true

      # @!attribute filter_in_queue_ids
      #   The IDs of the queues the action is available in.
      #
      #   @return [Array<String>, nil]
      optional :filter_in_queue_ids,
               ModerationAPI::Internal::Type::ArrayOf[String],
               api_name: :filterInQueueIds

      # @!attribute free_text
      #   Whether the action allows any text to be entered as a value or if it must be one
      #   of the possible values.
      #
      #   @return [Boolean, nil]
      optional :free_text, ModerationAPI::Internal::Type::Boolean, api_name: :freeText

      # @!attribute key
      #   User defined key of the action.
      #
      #   @return [String, nil]
      optional :key, String, nil?: true

      # @!attribute name
      #   The name of the action.
      #
      #   @return [String, nil]
      optional :name, String

      # @!attribute position
      #   Show the action in all queues, selected queues or no queues (to use via API
      #   only).
      #
      #   @return [Symbol, ModerationAPI::Models::ActionUpdateParams::Position, nil]
      optional :position, enum: -> { ModerationAPI::ActionUpdateParams::Position }

      # @!attribute possible_values
      #   The possible values of the action. The user will be prompted to select one of
      #   these values when executing the action.
      #
      #   @return [Array<ModerationAPI::Models::ActionUpdateParams::PossibleValue>, nil]
      optional :possible_values,
               -> {
                 ModerationAPI::Internal::Type::ArrayOf[ModerationAPI::ActionUpdateParams::PossibleValue]
               },
               api_name: :possibleValues

      # @!attribute queue_behaviour
      #   Whether the action resolves and removes the item, unresolves and re-add it to
      #   the queue, or does not change the resolve status.
      #
      #   @return [Symbol, ModerationAPI::Models::ActionUpdateParams::QueueBehaviour, nil]
      optional :queue_behaviour,
               enum: -> { ModerationAPI::ActionUpdateParams::QueueBehaviour },
               api_name: :queueBehaviour

      # @!attribute type
      #   The type of the action.
      #
      #   @return [Symbol, ModerationAPI::Models::ActionUpdateParams::Type, nil]
      optional :type, enum: -> { ModerationAPI::ActionUpdateParams::Type }, nil?: true

      # @!attribute value_required
      #   Whether the action requires a value to be executed.
      #
      #   @return [Boolean, nil]
      optional :value_required, ModerationAPI::Internal::Type::Boolean, api_name: :valueRequired

      # @!attribute webhooks
      #   The action's webhooks.
      #
      #   @return [Array<ModerationAPI::Models::ActionUpdateParams::Webhook>, nil]
      optional :webhooks,
               -> { ModerationAPI::Internal::Type::ArrayOf[ModerationAPI::ActionUpdateParams::Webhook] }

      # @!method initialize(built_in: nil, description: nil, filter_in_queue_ids: nil, free_text: nil, key: nil, name: nil, position: nil, possible_values: nil, queue_behaviour: nil, type: nil, value_required: nil, webhooks: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {ModerationAPI::Models::ActionUpdateParams} for more details.
      #
      #   @param built_in [Boolean, nil] Whether the action is a built-in action or a custom one.
      #
      #   @param description [String, nil] The description of the action.
      #
      #   @param filter_in_queue_ids [Array<String>] The IDs of the queues the action is available in.
      #
      #   @param free_text [Boolean] Whether the action allows any text to be entered as a value or if it must be one
      #
      #   @param key [String, nil] User defined key of the action.
      #
      #   @param name [String] The name of the action.
      #
      #   @param position [Symbol, ModerationAPI::Models::ActionUpdateParams::Position] Show the action in all queues, selected queues or no queues (to use via API only
      #
      #   @param possible_values [Array<ModerationAPI::Models::ActionUpdateParams::PossibleValue>] The possible values of the action. The user will be prompted to select one of th
      #
      #   @param queue_behaviour [Symbol, ModerationAPI::Models::ActionUpdateParams::QueueBehaviour] Whether the action resolves and removes the item, unresolves and re-add it to th
      #
      #   @param type [Symbol, ModerationAPI::Models::ActionUpdateParams::Type, nil] The type of the action.
      #
      #   @param value_required [Boolean] Whether the action requires a value to be executed.
      #
      #   @param webhooks [Array<ModerationAPI::Models::ActionUpdateParams::Webhook>] The action's webhooks.
      #
      #   @param request_options [ModerationAPI::RequestOptions, Hash{Symbol=>Object}]

      # Show the action in all queues, selected queues or no queues (to use via API
      # only).
      module Position
        extend ModerationAPI::Internal::Type::Enum

        ALL_QUEUES = :ALL_QUEUES
        SOME_QUEUES = :SOME_QUEUES
        HIDDEN = :HIDDEN

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      class PossibleValue < ModerationAPI::Internal::Type::BaseModel
        # @!attribute value
        #   The value of the action.
        #
        #   @return [String]
        required :value, String

        # @!method initialize(value:)
        #   @param value [String] The value of the action.
      end

      # Whether the action resolves and removes the item, unresolves and re-add it to
      # the queue, or does not change the resolve status.
      module QueueBehaviour
        extend ModerationAPI::Internal::Type::Enum

        REMOVE = :REMOVE
        ADD = :ADD
        NO_CHANGE = :NO_CHANGE

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # The type of the action.
      module Type
        extend ModerationAPI::Internal::Type::Enum

        AUTHOR_BLOCK = :AUTHOR_BLOCK
        AUTHOR_BLOCK_TEMP = :AUTHOR_BLOCK_TEMP
        AUTHOR_UNBLOCK = :AUTHOR_UNBLOCK
        AUTHOR_DELETE = :AUTHOR_DELETE
        AUTHOR_REPORT = :AUTHOR_REPORT
        AUTHOR_WARN = :AUTHOR_WARN
        AUTHOR_CUSTOM = :AUTHOR_CUSTOM
        ITEM_REJECT = :ITEM_REJECT
        ITEM_ALLOW = :ITEM_ALLOW
        ITEM_CUSTOM = :ITEM_CUSTOM

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      class Webhook < ModerationAPI::Internal::Type::BaseModel
        # @!attribute name
        #   The webhook's name, used to identify it in the dashboard
        #
        #   @return [String]
        required :name, String

        # @!attribute url
        #   The webhook's URL. We'll call this URL when the event occurs.
        #
        #   @return [String]
        required :url, String

        # @!attribute id
        #   ID of an existing webhook or undefined if this is a new webhook.
        #
        #   @return [String, nil]
        optional :id, String

        # @!attribute description
        #   The webhook's description
        #
        #   @return [String, nil]
        optional :description, String, nil?: true

        # @!method initialize(name:, url:, id: nil, description: nil)
        #   @param name [String] The webhook's name, used to identify it in the dashboard
        #
        #   @param url [String] The webhook's URL. We'll call this URL when the event occurs.
        #
        #   @param id [String] ID of an existing webhook or undefined if this is a new webhook.
        #
        #   @param description [String, nil] The webhook's description
      end
    end
  end
end
