# frozen_string_literal: true

require_relative "../test_helper"

class ModerationAPI::Test::Resources::WebhooksTest < ModerationAPI::Test::ResourceTest
  def test_create_required_params
    skip("Mock server tests are disabled")

    response =
      @moderation_api.webhooks.create(event_types: [:QUEUE_ITEM_NEW], name: "x", url: "https://example.com")

    assert_pattern do
      response => ModerationAPI::Models::WebhookCreateResponse
    end

    assert_pattern do
      response => {
        id: String,
        created_at: String,
        event_types: ^(ModerationAPI::Internal::Type::ArrayOf[enum: ModerationAPI::Models::WebhookCreateResponse::EventType]),
        name: String,
        payload_version: ModerationAPI::Models::WebhookCreateResponse::PayloadVersion,
        url: String,
        description: String | nil
      }
    end
  end

  def test_retrieve
    skip("Mock server tests are disabled")

    response = @moderation_api.webhooks.retrieve("id")

    assert_pattern do
      response => ModerationAPI::Models::WebhookRetrieveResponse
    end

    assert_pattern do
      response => {
        id: String,
        created_at: String,
        event_types: ^(ModerationAPI::Internal::Type::ArrayOf[enum: ModerationAPI::Models::WebhookRetrieveResponse::EventType]),
        name: String,
        payload_version: ModerationAPI::Models::WebhookRetrieveResponse::PayloadVersion,
        url: String,
        description: String | nil
      }
    end
  end

  def test_update
    skip("Mock server tests are disabled")

    response = @moderation_api.webhooks.update("id")

    assert_pattern do
      response => ModerationAPI::Models::WebhookUpdateResponse
    end

    assert_pattern do
      response => {
        id: String,
        created_at: String,
        event_types: ^(ModerationAPI::Internal::Type::ArrayOf[enum: ModerationAPI::Models::WebhookUpdateResponse::EventType]),
        name: String,
        payload_version: ModerationAPI::Models::WebhookUpdateResponse::PayloadVersion,
        url: String,
        description: String | nil
      }
    end
  end

  def test_list
    skip("Mock server tests are disabled")

    response = @moderation_api.webhooks.list

    assert_pattern do
      response => ^(ModerationAPI::Internal::Type::ArrayOf[ModerationAPI::Models::WebhookListResponseItem])
    end
  end

  def test_delete
    skip("Mock server tests are disabled")

    response = @moderation_api.webhooks.delete("id")

    assert_pattern do
      response => ModerationAPI::Models::WebhookDeleteResponse
    end

    assert_pattern do
      response => {
        id: String,
        deleted: ModerationAPI::Internal::Type::Boolean
      }
    end
  end
end
