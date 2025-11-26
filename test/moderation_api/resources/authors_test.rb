# frozen_string_literal: true

require_relative "../test_helper"

class ModerationAPI::Test::Resources::AuthorsTest < ModerationAPI::Test::ResourceTest
  def test_create_required_params
    skip("Prism tests are disabled")

    response = @moderation_api.authors.create(external_id: "external_id")

    assert_pattern do
      response => ModerationAPI::Models::AuthorCreateResponse
    end

    assert_pattern do
      response => {
        id: String,
        block: ModerationAPI::Models::AuthorCreateResponse::Block | nil,
        first_seen: Float,
        last_seen: Float,
        metadata: ModerationAPI::Models::AuthorCreateResponse::Metadata,
        metrics: ModerationAPI::Models::AuthorCreateResponse::Metrics,
        risk_evaluation: ModerationAPI::Models::AuthorCreateResponse::RiskEvaluation | nil,
        status: ModerationAPI::Models::AuthorCreateResponse::Status,
        trust_level: ModerationAPI::Models::AuthorCreateResponse::TrustLevel,
        email: String | nil,
        external_id: String | nil,
        external_link: String | nil,
        last_incident: Float | nil,
        name: String | nil,
        profile_picture: String | nil
      }
    end
  end

  def test_retrieve
    skip("Prism tests are disabled")

    response = @moderation_api.authors.retrieve("id")

    assert_pattern do
      response => ModerationAPI::Models::AuthorRetrieveResponse
    end

    assert_pattern do
      response => {
        id: String,
        block: ModerationAPI::Models::AuthorRetrieveResponse::Block | nil,
        first_seen: Float,
        last_seen: Float,
        metadata: ModerationAPI::Models::AuthorRetrieveResponse::Metadata,
        metrics: ModerationAPI::Models::AuthorRetrieveResponse::Metrics,
        risk_evaluation: ModerationAPI::Models::AuthorRetrieveResponse::RiskEvaluation | nil,
        status: ModerationAPI::Models::AuthorRetrieveResponse::Status,
        trust_level: ModerationAPI::Models::AuthorRetrieveResponse::TrustLevel,
        email: String | nil,
        external_id: String | nil,
        external_link: String | nil,
        last_incident: Float | nil,
        name: String | nil,
        profile_picture: String | nil
      }
    end
  end

  def test_update
    skip("Prism tests are disabled")

    response = @moderation_api.authors.update("id")

    assert_pattern do
      response => ModerationAPI::Models::AuthorUpdateResponse
    end

    assert_pattern do
      response => {
        id: String,
        block: ModerationAPI::Models::AuthorUpdateResponse::Block | nil,
        first_seen: Float,
        last_seen: Float,
        metadata: ModerationAPI::Models::AuthorUpdateResponse::Metadata,
        metrics: ModerationAPI::Models::AuthorUpdateResponse::Metrics,
        risk_evaluation: ModerationAPI::Models::AuthorUpdateResponse::RiskEvaluation | nil,
        status: ModerationAPI::Models::AuthorUpdateResponse::Status,
        trust_level: ModerationAPI::Models::AuthorUpdateResponse::TrustLevel,
        email: String | nil,
        external_id: String | nil,
        external_link: String | nil,
        last_incident: Float | nil,
        name: String | nil,
        profile_picture: String | nil
      }
    end
  end

  def test_list
    skip("Prism tests are disabled")

    response = @moderation_api.authors.list

    assert_pattern do
      response => ModerationAPI::Models::AuthorListResponse
    end

    assert_pattern do
      response => {
        authors: ^(ModerationAPI::Internal::Type::ArrayOf[ModerationAPI::Models::AuthorListResponse::Author]),
        pagination: ModerationAPI::Models::AuthorListResponse::Pagination
      }
    end
  end

  def test_delete
    skip("Prism tests are disabled")

    response = @moderation_api.authors.delete("id")

    assert_pattern do
      response => ModerationAPI::Models::AuthorDeleteResponse
    end

    assert_pattern do
      response => {
        success: ModerationAPI::Internal::Type::Boolean
      }
    end
  end
end
