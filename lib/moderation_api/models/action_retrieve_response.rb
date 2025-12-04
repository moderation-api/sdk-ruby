# frozen_string_literal: true

module ModerationAPI
  module Models
    # @see ModerationAPI::Resources::Actions#retrieve
    class ActionRetrieveResponse < ModerationAPI::Internal::Type::BaseModel
      # @!attribute id
      #   The ID of the action.
      #
      #   @return [String]
      required :id, String

      # @!attribute built_in
      #   Whether the action is a built-in action or a custom one.
      #
      #   @return [Boolean, nil]
      required :built_in, ModerationAPI::Internal::Type::Boolean, api_name: :builtIn, nil?: true

      # @!attribute created_at
      #   The date the action was created.
      #
      #   @return [String]
      required :created_at, String, api_name: :createdAt

      # @!attribute filter_in_queue_ids
      #   The IDs of the queues the action is available in.
      #
      #   @return [Array<String>]
      required :filter_in_queue_ids,
               ModerationAPI::Internal::Type::ArrayOf[String],
               api_name: :filterInQueueIds

      # @!attribute free_text
      #   Whether the action allows any text to be entered as a value or if it must be one
      #   of the possible values.
      #
      #   @return [Boolean]
      required :free_text, ModerationAPI::Internal::Type::Boolean, api_name: :freeText

      # @!attribute name
      #   The name of the action.
      #
      #   @return [String]
      required :name, String

      # @!attribute position
      #   Show the action in all queues, selected queues or no queues (to use via API
      #   only).
      #
      #   @return [Symbol, ModerationAPI::Models::ActionRetrieveResponse::Position]
      required :position, enum: -> { ModerationAPI::Models::ActionRetrieveResponse::Position }

      # @!attribute possible_values
      #   The possible values of the action. The user will be prompted to select one of
      #   these values when executing the action.
      #
      #   @return [Array<ModerationAPI::Models::ActionRetrieveResponse::PossibleValue>]
      required :possible_values,
               -> { ModerationAPI::Internal::Type::ArrayOf[ModerationAPI::Models::ActionRetrieveResponse::PossibleValue] },
               api_name: :possibleValues

      # @!attribute queue_behaviour
      #   Whether the action resolves and removes the item, unresolves and re-add it to
      #   the queue, or does not change the resolve status.
      #
      #   @return [Symbol, ModerationAPI::Models::ActionRetrieveResponse::QueueBehaviour]
      required :queue_behaviour,
               enum: -> { ModerationAPI::Models::ActionRetrieveResponse::QueueBehaviour },
               api_name: :queueBehaviour

      # @!attribute value_required
      #   Whether the action requires a value to be executed.
      #
      #   @return [Boolean]
      required :value_required, ModerationAPI::Internal::Type::Boolean, api_name: :valueRequired

      # @!attribute webhooks
      #   The action's webhooks.
      #
      #   @return [Array<ModerationAPI::Models::ActionRetrieveResponse::Webhook>]
      required :webhooks,
               -> { ModerationAPI::Internal::Type::ArrayOf[ModerationAPI::Models::ActionRetrieveResponse::Webhook] }

      # @!attribute description
      #   The description of the action.
      #
      #   @return [String, nil]
      optional :description, String, nil?: true

      # @!attribute key
      #   User defined key of the action.
      #
      #   @return [String, nil]
      optional :key, String, nil?: true

      # @!attribute type
      #   The type of the action.
      #
      #   @return [Symbol, ModerationAPI::Models::ActionRetrieveResponse::Type, nil]
      optional :type, enum: -> { ModerationAPI::Models::ActionRetrieveResponse::Type }, nil?: true

      # @!method initialize(id:, built_in:, created_at:, filter_in_queue_ids:, free_text:, name:, position:, possible_values:, queue_behaviour:, value_required:, webhooks:, description: nil, key: nil, type: nil)
      #   Some parameter documentations has been truncated, see
      #   {ModerationAPI::Models::ActionRetrieveResponse} for more details.
      #
      #   @param id [String] The ID of the action.
      #
      #   @param built_in [Boolean, nil] Whether the action is a built-in action or a custom one.
      #
      #   @param created_at [String] The date the action was created.
      #
      #   @param filter_in_queue_ids [Array<String>] The IDs of the queues the action is available in.
      #
      #   @param free_text [Boolean] Whether the action allows any text to be entered as a value or if it must be one
      #
      #   @param name [String] The name of the action.
      #
      #   @param position [Symbol, ModerationAPI::Models::ActionRetrieveResponse::Position] Show the action in all queues, selected queues or no queues (to use via API only
      #
      #   @param possible_values [Array<ModerationAPI::Models::ActionRetrieveResponse::PossibleValue>] The possible values of the action. The user will be prompted to select one of th
      #
      #   @param queue_behaviour [Symbol, ModerationAPI::Models::ActionRetrieveResponse::QueueBehaviour] Whether the action resolves and removes the item, unresolves and re-add it to th
      #
      #   @param value_required [Boolean] Whether the action requires a value to be executed.
      #
      #   @param webhooks [Array<ModerationAPI::Models::ActionRetrieveResponse::Webhook>] The action's webhooks.
      #
      #   @param description [String, nil] The description of the action.
      #
      #   @param key [String, nil] User defined key of the action.
      #
      #   @param type [Symbol, ModerationAPI::Models::ActionRetrieveResponse::Type, nil] The type of the action.

      # Show the action in all queues, selected queues or no queues (to use via API
      # only).
      #
      # @see ModerationAPI::Models::ActionRetrieveResponse#position
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
      #
      # @see ModerationAPI::Models::ActionRetrieveResponse#queue_behaviour
      module QueueBehaviour
        extend ModerationAPI::Internal::Type::Enum

        REMOVE = :REMOVE
        ADD = :ADD
        NO_CHANGE = :NO_CHANGE

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      class Webhook < ModerationAPI::Internal::Type::BaseModel
        # @!attribute id
        #   The ID of the webhook.
        #
        #   @return [String]
        required :id, String

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

        # @!attribute description
        #   The webhook's description
        #
        #   @return [String, nil]
        optional :description, String, nil?: true

        # @!attribute moderation_action_id
        #   The ID of the moderation action to trigger the webhook on. Only used for
        #   moderation action webhooks.
        #
        #   @return [String, nil]
        optional :moderation_action_id, String, api_name: :moderationActionId, nil?: true

        # @!method initialize(id:, name:, url:, description: nil, moderation_action_id: nil)
        #   Some parameter documentations has been truncated, see
        #   {ModerationAPI::Models::ActionRetrieveResponse::Webhook} for more details.
        #
        #   @param id [String] The ID of the webhook.
        #
        #   @param name [String] The webhook's name, used to identify it in the dashboard
        #
        #   @param url [String] The webhook's URL. We'll call this URL when the event occurs.
        #
        #   @param description [String, nil] The webhook's description
        #
        #   @param moderation_action_id [String, nil] The ID of the moderation action to trigger the webhook on. Only used for moderat
      end

      # The type of the action.
      #
      # @see ModerationAPI::Models::ActionRetrieveResponse#type
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
    end
  end
end
