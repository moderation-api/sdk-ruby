# frozen_string_literal: true

module ModerationAPI
  module Models
    module Actions
      # @see ModerationAPI::Resources::Actions::Execute#execute
      class ExecuteExecuteParams < ModerationAPI::Internal::Type::BaseModel
        extend ModerationAPI::Internal::Type::RequestParameters::Converter
        include ModerationAPI::Internal::Type::RequestParameters

        # @!attribute action_key
        #   ID or key of the action to execute
        #
        #   @return [String]
        required :action_key, String, api_name: :actionKey

        # @!attribute author_ids
        #   IDs of the authors to apply the action to. Provide this or contentIds.
        #
        #   @return [Array<String>, nil]
        optional :author_ids, ModerationAPI::Internal::Type::ArrayOf[String], api_name: :authorIds

        # @!attribute content_ids
        #   IDs of the content items to apply the action to. Provide this or authorIds.
        #
        #   @return [Array<String>, nil]
        optional :content_ids, ModerationAPI::Internal::Type::ArrayOf[String], api_name: :contentIds

        # @!attribute duration
        #   Optional duration in milliseconds for actions with timeouts
        #
        #   @return [Float, nil]
        optional :duration, Float

        # @!attribute queue_id
        #   Optional queue ID if the action is queue-specific
        #
        #   @return [String, nil]
        optional :queue_id, String, api_name: :queueId

        # @!attribute value
        #   Optional value to provide with the action
        #
        #   @return [String, nil]
        optional :value, String

        # @!method initialize(action_key:, author_ids: nil, content_ids: nil, duration: nil, queue_id: nil, value: nil, request_options: {})
        #   @param action_key [String] ID or key of the action to execute
        #
        #   @param author_ids [Array<String>] IDs of the authors to apply the action to. Provide this or contentIds.
        #
        #   @param content_ids [Array<String>] IDs of the content items to apply the action to. Provide this or authorIds.
        #
        #   @param duration [Float] Optional duration in milliseconds for actions with timeouts
        #
        #   @param queue_id [String] Optional queue ID if the action is queue-specific
        #
        #   @param value [String] Optional value to provide with the action
        #
        #   @param request_options [ModerationAPI::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
