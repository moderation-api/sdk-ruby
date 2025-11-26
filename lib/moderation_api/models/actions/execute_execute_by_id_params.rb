# frozen_string_literal: true

module ModerationAPI
  module Models
    module Actions
      # @see ModerationAPI::Resources::Actions::Execute#execute_by_id
      class ExecuteExecuteByIDParams < ModerationAPI::Internal::Type::BaseModel
        extend ModerationAPI::Internal::Type::RequestParameters::Converter
        include ModerationAPI::Internal::Type::RequestParameters

        # @!attribute author_ids
        #   IDs of the authors to apply the action to
        #
        #   @return [Array<String>, nil]
        optional :author_ids, ModerationAPI::Internal::Type::ArrayOf[String], api_name: :authorIds

        # @!attribute content_ids
        #   The IDs of the content items to perform the action on.
        #
        #   @return [Array<String>, nil]
        optional :content_ids, ModerationAPI::Internal::Type::ArrayOf[String], api_name: :contentIds

        # @!attribute queue_id
        #   The ID of the queue the action was performed from if any.
        #
        #   @return [String, nil]
        optional :queue_id, String, api_name: :queueId

        # @!attribute value
        #   The value of the action. Useful to set a reason for the action etc.
        #
        #   @return [String, nil]
        optional :value, String

        # @!method initialize(author_ids: nil, content_ids: nil, queue_id: nil, value: nil, request_options: {})
        #   @param author_ids [Array<String>] IDs of the authors to apply the action to
        #
        #   @param content_ids [Array<String>] The IDs of the content items to perform the action on.
        #
        #   @param queue_id [String] The ID of the queue the action was performed from if any.
        #
        #   @param value [String] The value of the action. Useful to set a reason for the action etc.
        #
        #   @param request_options [ModerationAPI::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
