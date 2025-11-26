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

  def test_analyze_audio_required_params
    skip("Prism tests are disabled")

    response = @moderation_api.moderate.analyze_audio(url: "https://example.com")

    assert_pattern do
      response => ModerationAPI::Models::ModerateAnalyzeAudioResponse
    end

    assert_pattern do
      response => {
        author: ModerationAPI::Models::ModerateAnalyzeAudioResponse::Author | nil,
        flagged: ModerationAPI::Internal::Type::Boolean,
        request: ModerationAPI::Models::ModerateAnalyzeAudioResponse::Request,
        status: String,
        content_id: String | nil,
        error: ModerationAPI::Internal::Type::Unknown | nil
      }
    end
  end

  def test_analyze_image_required_params
    skip("Prism tests are disabled")

    response = @moderation_api.moderate.analyze_image(url: "https://example.com")

    assert_pattern do
      response => ModerationAPI::Models::ModerateAnalyzeImageResponse
    end

    assert_pattern do
      response => {
        author: ModerationAPI::Models::ModerateAnalyzeImageResponse::Author | nil,
        flagged: ModerationAPI::Internal::Type::Boolean,
        labels: ^(ModerationAPI::Internal::Type::ArrayOf[ModerationAPI::Models::ModerateAnalyzeImageResponse::Label]),
        request: ModerationAPI::Models::ModerateAnalyzeImageResponse::Request,
        status: String,
        content_id: String | nil,
        error: ModerationAPI::Internal::Type::Unknown | nil,
        texts: ^(ModerationAPI::Internal::Type::ArrayOf[String]) | nil
      }
    end
  end

  def test_analyze_object_required_params
    skip("Prism tests are disabled")

    response =
      @moderation_api.moderate.analyze_object(
        value: {data: {foo: {type: :text, value: "value"}}, type: :profile}
      )

    assert_pattern do
      response => ModerationAPI::Models::ModerateAnalyzeObjectResponse
    end

    assert_pattern do
      response => {
        author: ModerationAPI::Models::ModerateAnalyzeObjectResponse::Author | nil,
        data_found: ModerationAPI::Internal::Type::Boolean,
        entities: ^(ModerationAPI::Internal::Type::ArrayOf[ModerationAPI::Models::ModerateAnalyzeObjectResponse::Entity]),
        fields: ^(ModerationAPI::Internal::Type::ArrayOf[ModerationAPI::Models::ModerateAnalyzeObjectResponse::Field]),
        flagged: ModerationAPI::Internal::Type::Boolean,
        labels: ^(ModerationAPI::Internal::Type::ArrayOf[ModerationAPI::Models::ModerateAnalyzeObjectResponse::Label]),
        request: ModerationAPI::Models::ModerateAnalyzeObjectResponse::Request,
        status: String,
        unicode_spoofing: ModerationAPI::Internal::Type::Boolean,
        content_id: String | nil,
        error: ModerationAPI::Internal::Type::Unknown | nil,
        wordlists: ^(ModerationAPI::Internal::Type::ArrayOf[ModerationAPI::Models::ModerateAnalyzeObjectResponse::Wordlist]) | nil
      }
    end
  end

  def test_analyze_text_required_params
    skip("Prism tests are disabled")

    response = @moderation_api.moderate.analyze_text(value: "x")

    assert_pattern do
      response => ModerationAPI::Models::ModerateAnalyzeTextResponse
    end

    assert_pattern do
      response => {
        author: ModerationAPI::Models::ModerateAnalyzeTextResponse::Author | nil,
        content: String,
        content_moderated: ModerationAPI::Internal::Type::Boolean,
        data_found: ModerationAPI::Internal::Type::Boolean,
        flagged: ModerationAPI::Internal::Type::Boolean,
        original: String,
        request: ModerationAPI::Models::ModerateAnalyzeTextResponse::Request,
        status: String,
        unicode_spoofing: ModerationAPI::Internal::Type::Boolean,
        address: ModerationAPI::Models::ModerateAnalyzeTextResponse::Address | nil,
        content_id: String | nil,
        email: ModerationAPI::Models::ModerateAnalyzeTextResponse::Email | nil,
        error: ModerationAPI::Internal::Type::Unknown | nil,
        name: ModerationAPI::Models::ModerateAnalyzeTextResponse::Name | nil,
        nsfw: ModerationAPI::Models::ModerateAnalyzeTextResponse::Nsfw | nil,
        phone: ModerationAPI::Models::ModerateAnalyzeTextResponse::Phone | nil,
        profanity: ModerationAPI::Models::ModerateAnalyzeTextResponse::Profanity | nil,
        propriety: ModerationAPI::Models::ModerateAnalyzeTextResponse::Propriety | nil,
        quality: ModerationAPI::Models::ModerateAnalyzeTextResponse::Quality | nil,
        sensitive: ModerationAPI::Models::ModerateAnalyzeTextResponse::Sensitive | nil,
        sentiment: ModerationAPI::Models::ModerateAnalyzeTextResponse::Sentiment | nil,
        toxicity: ModerationAPI::Models::ModerateAnalyzeTextResponse::Toxicity | nil,
        url: ModerationAPI::Models::ModerateAnalyzeTextResponse::URL | nil,
        username: ModerationAPI::Models::ModerateAnalyzeTextResponse::Username | nil,
        wordlist: ModerationAPI::Models::ModerateAnalyzeTextResponse::Wordlist | nil,
        wordlists: ^(ModerationAPI::Internal::Type::ArrayOf[ModerationAPI::Models::ModerateAnalyzeTextResponse::Wordlist]) | nil
      }
    end
  end

  def test_analyze_video_required_params
    skip("Prism tests are disabled")

    response = @moderation_api.moderate.analyze_video(url: "https://example.com")

    assert_pattern do
      response => ModerationAPI::Models::ModerateAnalyzeVideoResponse
    end

    assert_pattern do
      response => {
        author: ModerationAPI::Models::ModerateAnalyzeVideoResponse::Author | nil,
        flagged: ModerationAPI::Internal::Type::Boolean,
        request: ModerationAPI::Models::ModerateAnalyzeVideoResponse::Request,
        status: String,
        content_id: String | nil,
        error: ModerationAPI::Internal::Type::Unknown | nil
      }
    end
  end
end
