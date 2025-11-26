# frozen_string_literal: true

module ModerationAPI
  module Models
    # @see ModerationAPI::Resources::Account#list
    class AccountListResponse < ModerationAPI::Internal::Type::BaseModel
      # @!attribute id
      #   ID of the account
      #
      #   @return [String]
      required :id, String

      # @!attribute paid_plan_name
      #   Name of the paid plan
      #
      #   @return [String]
      required :paid_plan_name, String

      # @!attribute remaining_quota
      #   Remaining quota
      #
      #   @return [Float]
      required :remaining_quota, Float

      # @!attribute text_api_quota
      #   Text API quota
      #
      #   @return [Float]
      required :text_api_quota, Float

      # @!attribute current_project
      #
      #   @return [ModerationAPI::Models::AccountListResponse::CurrentProject, nil]
      optional :current_project, -> { ModerationAPI::Models::AccountListResponse::CurrentProject }

      # @!method initialize(id:, paid_plan_name:, remaining_quota:, text_api_quota:, current_project: nil)
      #   @param id [String] ID of the account
      #
      #   @param paid_plan_name [String] Name of the paid plan
      #
      #   @param remaining_quota [Float] Remaining quota
      #
      #   @param text_api_quota [Float] Text API quota
      #
      #   @param current_project [ModerationAPI::Models::AccountListResponse::CurrentProject]

      # @see ModerationAPI::Models::AccountListResponse#current_project
      class CurrentProject < ModerationAPI::Internal::Type::BaseModel
        # @!attribute id
        #   ID of the current project
        #
        #   @return [String]
        required :id, String

        # @!attribute name
        #   Name of the current project
        #
        #   @return [String]
        required :name, String

        # @!method initialize(id:, name:)
        #   @param id [String] ID of the current project
        #
        #   @param name [String] Name of the current project
      end
    end
  end
end
