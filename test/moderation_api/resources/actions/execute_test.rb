# frozen_string_literal: true

require_relative "../../test_helper"

class ModerationAPI::Test::Resources::Actions::ExecuteTest < ModerationAPI::Test::ResourceTest
  def test_execute_required_params
    skip("Mock server tests are disabled")

    response = @moderation_api.actions.execute.execute(action_key: "actionKey")

    assert_pattern do
      response => ModerationAPI::Models::Actions::ExecuteExecuteResponse
    end

    assert_pattern do
      response => {
        success: ModerationAPI::Internal::Type::Boolean
      }
    end
  end

  def test_execute_by_id
    skip("Mock server tests are disabled")

    response = @moderation_api.actions.execute.execute_by_id("actionId")

    assert_pattern do
      response => ModerationAPI::Models::Actions::ExecuteExecuteByIDResponse
    end

    assert_pattern do
      response => {
        action_id: String,
        ids: ^(ModerationAPI::Internal::Type::ArrayOf[String]),
        success: ModerationAPI::Internal::Type::Boolean
      }
    end
  end
end
