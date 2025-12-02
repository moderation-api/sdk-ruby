# frozen_string_literal: true

require_relative "../test_helper"

class ModerationAPI::Test::Resources::ModerateTest < ModerationAPI::Test::ResourceTest
  def test_analyze_required_params
    skip("Prism tests are disabled")

    response = @moderation_api.moderate.analyze(content: {text: "x", type: :text})

    assert_pattern do
      response => ModerationAPI::Models::ModerateAnalyzeResponse
    end

    assert_pattern do
      response => {
        author: ModerationAPI::Models::ModerateAnalyzeResponse::Author | nil,
        content: ModerationAPI::Models::ModerateAnalyzeResponse::Content,
        evaluation: ModerationAPI::Models::ModerateAnalyzeResponse::Evaluation,
        insights: ^(ModerationAPI::Internal::Type::ArrayOf[union: ModerationAPI::Models::ModerateAnalyzeResponse::Insight]),
        meta: ModerationAPI::Models::ModerateAnalyzeResponse::Meta,
        policies: ^(ModerationAPI::Internal::Type::ArrayOf[union: ModerationAPI::Models::ModerateAnalyzeResponse::Policy]),
        recommendation: ModerationAPI::Models::ModerateAnalyzeResponse::Recommendation,
        errors: ^(ModerationAPI::Internal::Type::ArrayOf[ModerationAPI::Models::ModerateAnalyzeResponse::Error]) | nil
      }
    end
  end
end
