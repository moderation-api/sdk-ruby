# frozen_string_literal: true

require_relative "../../test_helper"

class ModerationAPI::Test::Resources::Queue::ItemsTest < ModerationAPI::Test::ResourceTest
  def test_list
    skip("Mock server tests are disabled")

    response = @moderation_api.queue.items.list("id")

    assert_pattern do
      response => ModerationAPI::Models::Queue::ItemListResponse
    end

    assert_pattern do
      response => {
        items: ^(ModerationAPI::Internal::Type::ArrayOf[ModerationAPI::Models::Queue::ItemListResponse::Item]),
        pagination: ModerationAPI::Models::Queue::ItemListResponse::Pagination
      }
    end
  end

  def test_resolve_required_params
    skip("Mock server tests are disabled")

    response = @moderation_api.queue.items.resolve("itemId", id: "id")

    assert_pattern do
      response => ModerationAPI::Models::Queue::ItemResolveResponse
    end

    assert_pattern do
      response => {
        resolved_at: String,
        success: ModerationAPI::Internal::Type::Boolean,
        comment: String | nil
      }
    end
  end

  def test_unresolve_required_params
    skip("Mock server tests are disabled")

    response = @moderation_api.queue.items.unresolve("itemId", id: "id")

    assert_pattern do
      response => ModerationAPI::Models::Queue::ItemUnresolveResponse
    end

    assert_pattern do
      response => {
        status: String,
        success: ModerationAPI::Internal::Type::Boolean,
        unresolved_at: String
      }
    end
  end
end
