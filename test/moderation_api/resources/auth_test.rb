# frozen_string_literal: true

require_relative "../test_helper"

class ModerationAPI::Test::Resources::AuthTest < ModerationAPI::Test::ResourceTest
  def test_create
    skip("Prism tests are disabled")

    response = @moderation_api.auth.create

    assert_pattern do
      response => ModerationAPI::Models::AuthCreateResponse
    end

    assert_pattern do
      response => {
        message: String,
        project: String,
        status: String
      }
    end
  end

  def test_retrieve
    skip("Prism tests are disabled")

    response = @moderation_api.auth.retrieve

    assert_pattern do
      response => ModerationAPI::Models::AuthRetrieveResponse
    end

    assert_pattern do
      response => {
        message: String,
        status: String
      }
    end
  end
end
