# frozen_string_literal: true

require_relative "../test_helper"

class ModerationAPI::Test::Resources::WordlistTest < ModerationAPI::Test::ResourceTest
  def test_retrieve
    skip("Prism tests are disabled")

    response = @moderation_api.wordlist.retrieve("id")

    assert_pattern do
      response => ModerationAPI::Models::WordlistRetrieveResponse
    end

    assert_pattern do
      response => {
        id: String,
        created_at: String,
        name: String | nil,
        organization_id: String,
        strict: ModerationAPI::Internal::Type::Boolean,
        user_id: String | nil,
        words: ^(ModerationAPI::Internal::Type::ArrayOf[String])
      }
    end
  end

  def test_update
    skip("Prism tests are disabled")

    response = @moderation_api.wordlist.update("id")

    assert_pattern do
      response => ModerationAPI::Models::WordlistUpdateResponse
    end

    assert_pattern do
      response => {
        id: String,
        created_at: String,
        name: String | nil,
        organization_id: String,
        strict: ModerationAPI::Internal::Type::Boolean,
        user_id: String | nil,
        words: ^(ModerationAPI::Internal::Type::ArrayOf[String])
      }
    end
  end

  def test_list
    skip("Prism tests are disabled")

    response = @moderation_api.wordlist.list

    assert_pattern do
      response => ^(ModerationAPI::Internal::Type::ArrayOf[ModerationAPI::Models::WordlistListResponseItem])
    end
  end

  def test_get_embedding_status
    skip("Prism tests are disabled")

    response = @moderation_api.wordlist.get_embedding_status("id")

    assert_pattern do
      response => ModerationAPI::Models::WordlistGetEmbeddingStatusResponse
    end

    assert_pattern do
      response => {
        progress: Float,
        remaining_words: Float,
        total_words: Float
      }
    end
  end
end
