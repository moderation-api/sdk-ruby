# frozen_string_literal: true

require_relative "../test_helper"

class ModerationAPI::Test::Resources::AccountTest < ModerationAPI::Test::ResourceTest
  def test_list
    skip("Mock server tests are disabled")

    response = @moderation_api.account.list

    assert_pattern do
      response => ModerationAPI::Models::AccountListResponse
    end

    assert_pattern do
      response => {
        id: String,
        paid_plan_name: String,
        remaining_quota: Float,
        text_api_quota: Float,
        current_project: ModerationAPI::Models::AccountListResponse::CurrentProject | nil
      }
    end
  end
end
