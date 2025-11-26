# typed: strong

module ModerationAPI
  module Models
    class AccountListResponse < ModerationAPI::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            ModerationAPI::Models::AccountListResponse,
            ModerationAPI::Internal::AnyHash
          )
        end

      # ID of the account
      sig { returns(String) }
      attr_accessor :id

      # Name of the paid plan
      sig { returns(String) }
      attr_accessor :paid_plan_name

      # Remaining quota
      sig { returns(Float) }
      attr_accessor :remaining_quota

      # Text API quota
      sig { returns(Float) }
      attr_accessor :text_api_quota

      sig do
        returns(
          T.nilable(ModerationAPI::Models::AccountListResponse::CurrentProject)
        )
      end
      attr_reader :current_project

      sig do
        params(
          current_project:
            ModerationAPI::Models::AccountListResponse::CurrentProject::OrHash
        ).void
      end
      attr_writer :current_project

      sig do
        params(
          id: String,
          paid_plan_name: String,
          remaining_quota: Float,
          text_api_quota: Float,
          current_project:
            ModerationAPI::Models::AccountListResponse::CurrentProject::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # ID of the account
        id:,
        # Name of the paid plan
        paid_plan_name:,
        # Remaining quota
        remaining_quota:,
        # Text API quota
        text_api_quota:,
        current_project: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            paid_plan_name: String,
            remaining_quota: Float,
            text_api_quota: Float,
            current_project:
              ModerationAPI::Models::AccountListResponse::CurrentProject
          }
        )
      end
      def to_hash
      end

      class CurrentProject < ModerationAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ModerationAPI::Models::AccountListResponse::CurrentProject,
              ModerationAPI::Internal::AnyHash
            )
          end

        # ID of the current project
        sig { returns(String) }
        attr_accessor :id

        # Name of the current project
        sig { returns(String) }
        attr_accessor :name

        sig { params(id: String, name: String).returns(T.attached_class) }
        def self.new(
          # ID of the current project
          id:,
          # Name of the current project
          name:
        )
        end

        sig { override.returns({ id: String, name: String }) }
        def to_hash
        end
      end
    end
  end
end
