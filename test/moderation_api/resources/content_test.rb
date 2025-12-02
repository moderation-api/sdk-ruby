# frozen_string_literal: true

require_relative "../test_helper"

class ModerationAPI::Test::Resources::ContentTest < ModerationAPI::Test::ResourceTest
  def test_submit_required_params
    skip("Prism tests are disabled")

    response = @moderation_api.content.submit(content: {text: "x", type: :text})

    assert_pattern do
      response => ModerationAPI::Models::ContentSubmitResponse
    end

    assert_pattern do
      response => {
        author: ModerationAPI::Models::ContentSubmitResponse::Author | nil,
        content: ModerationAPI::Models::ContentSubmitResponse::Content,
        evaluation: ModerationAPI::Models::ContentSubmitResponse::Evaluation,
        insights: ^(ModerationAPI::Internal::Type::ArrayOf[union: ModerationAPI::Models::ContentSubmitResponse::Insight]),
        meta: ModerationAPI::Models::ContentSubmitResponse::Meta,
        policies: ^(ModerationAPI::Internal::Type::ArrayOf[union: ModerationAPI::Models::ContentSubmitResponse::Policy]),
        recommendation: ModerationAPI::Models::ContentSubmitResponse::Recommendation,
        errors: ^(ModerationAPI::Internal::Type::ArrayOf[ModerationAPI::Models::ContentSubmitResponse::Error]) | nil
      }
    end
  end
end
