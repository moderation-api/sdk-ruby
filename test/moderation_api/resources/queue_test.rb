# frozen_string_literal: true

require_relative "../test_helper"

class ModerationAPI::Test::Resources::QueueTest < ModerationAPI::Test::ResourceTest
  def test_retrieve
    skip("Mock server tests are disabled")

    response = @moderation_api.queue.retrieve("id")

    assert_pattern do
      response => ModerationAPI::Models::QueueRetrieveResponse
    end

    assert_pattern do
      response => {
        queue: ModerationAPI::Models::QueueRetrieveResponse::Queue
      }
    end
  end

  def test_get_stats
    skip("Mock server tests are disabled")

    response = @moderation_api.queue.get_stats("id")

    assert_pattern do
      response => ModerationAPI::Models::QueueGetStatsResponse
    end

    assert_pattern do
      response => {
        action_stats: ^(ModerationAPI::Internal::Type::ArrayOf[ModerationAPI::Models::QueueGetStatsResponse::ActionStat]),
        review_stats: ModerationAPI::Models::QueueGetStatsResponse::ReviewStats,
        top_reviewers: ^(ModerationAPI::Internal::Type::ArrayOf[ModerationAPI::Models::QueueGetStatsResponse::TopReviewer]),
        trends: ModerationAPI::Models::QueueGetStatsResponse::Trends
      }
    end
  end
end
