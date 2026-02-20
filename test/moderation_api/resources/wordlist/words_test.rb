# frozen_string_literal: true

require_relative "../../test_helper"

class ModerationAPI::Test::Resources::Wordlist::WordsTest < ModerationAPI::Test::ResourceTest
  def test_add_required_params
    skip("Mock server tests are disabled")

    response = @moderation_api.wordlist.words.add("id", words: ["string"])

    assert_pattern do
      response => ModerationAPI::Models::Wordlist::WordAddResponse
    end

    assert_pattern do
      response => {
        added_count: Float,
        added_words: ^(ModerationAPI::Internal::Type::ArrayOf[String]),
        total_count: Float
      }
    end
  end

  def test_remove_required_params
    skip("Mock server tests are disabled")

    response = @moderation_api.wordlist.words.remove("id", words: ["string"])

    assert_pattern do
      response => ModerationAPI::Models::Wordlist::WordRemoveResponse
    end

    assert_pattern do
      response => {
        removed_count: Float,
        removed_words: ^(ModerationAPI::Internal::Type::ArrayOf[String]),
        total_count: Float
      }
    end
  end
end
