# frozen_string_literal: true

require_relative "../test_helper"

class ModerationAPI::Test::Resources::WebhookSecretTest < ModerationAPI::Test::ResourceTest
  def test_retrieve
    skip("Mock server tests are disabled")

    response = @moderation_api.webhook_secret.retrieve

    assert_pattern do
      response => ModerationAPI::Models::WebhookSecretRetrieveResponse
    end

    assert_pattern do
      response => {
        secret: String
      }
    end
  end
end
