# frozen_string_literal: true

require_relative "../test_helper"

class ModerationAPI::Test::Resources::ActionsTest < ModerationAPI::Test::ResourceTest
  def test_create_required_params
    skip("Prism tests are disabled")

    response = @moderation_api.actions.create(name: "name")

    assert_pattern do
      response => ModerationAPI::Models::ActionCreateResponse
    end

    assert_pattern do
      response => {
        id: String,
        built_in: ModerationAPI::Internal::Type::Boolean | nil,
        created_at: String,
        filter_in_queue_ids: ^(ModerationAPI::Internal::Type::ArrayOf[String]),
        free_text: ModerationAPI::Internal::Type::Boolean,
        name: String,
        position: ModerationAPI::Models::ActionCreateResponse::Position,
        possible_values: ^(ModerationAPI::Internal::Type::ArrayOf[ModerationAPI::Models::ActionCreateResponse::PossibleValue]),
        queue_behaviour: ModerationAPI::Models::ActionCreateResponse::QueueBehaviour,
        value_required: ModerationAPI::Internal::Type::Boolean,
        description: String | nil,
        key: String | nil,
        type: ModerationAPI::Models::ActionCreateResponse::Type | nil
      }
    end
  end

  def test_retrieve
    skip("Prism tests are disabled")

    response = @moderation_api.actions.retrieve("id")

    assert_pattern do
      response => ModerationAPI::Models::ActionRetrieveResponse
    end

    assert_pattern do
      response => {
        id: String,
        built_in: ModerationAPI::Internal::Type::Boolean | nil,
        created_at: String,
        filter_in_queue_ids: ^(ModerationAPI::Internal::Type::ArrayOf[String]),
        free_text: ModerationAPI::Internal::Type::Boolean,
        name: String,
        position: ModerationAPI::Models::ActionRetrieveResponse::Position,
        possible_values: ^(ModerationAPI::Internal::Type::ArrayOf[ModerationAPI::Models::ActionRetrieveResponse::PossibleValue]),
        queue_behaviour: ModerationAPI::Models::ActionRetrieveResponse::QueueBehaviour,
        value_required: ModerationAPI::Internal::Type::Boolean,
        webhooks: ^(ModerationAPI::Internal::Type::ArrayOf[ModerationAPI::Models::ActionRetrieveResponse::Webhook]),
        description: String | nil,
        key: String | nil,
        type: ModerationAPI::Models::ActionRetrieveResponse::Type | nil
      }
    end
  end

  def test_update
    skip("Prism tests are disabled")

    response = @moderation_api.actions.update("id")

    assert_pattern do
      response => ModerationAPI::Models::ActionUpdateResponse
    end

    assert_pattern do
      response => {
        id: String,
        built_in: ModerationAPI::Internal::Type::Boolean | nil,
        created_at: String,
        filter_in_queue_ids: ^(ModerationAPI::Internal::Type::ArrayOf[String]),
        free_text: ModerationAPI::Internal::Type::Boolean,
        name: String,
        position: ModerationAPI::Models::ActionUpdateResponse::Position,
        possible_values: ^(ModerationAPI::Internal::Type::ArrayOf[ModerationAPI::Models::ActionUpdateResponse::PossibleValue]),
        queue_behaviour: ModerationAPI::Models::ActionUpdateResponse::QueueBehaviour,
        value_required: ModerationAPI::Internal::Type::Boolean,
        description: String | nil,
        key: String | nil,
        type: ModerationAPI::Models::ActionUpdateResponse::Type | nil
      }
    end
  end

  def test_list
    skip("Prism tests are disabled")

    response = @moderation_api.actions.list

    assert_pattern do
      response => ^(ModerationAPI::Internal::Type::ArrayOf[ModerationAPI::Models::ActionListResponseItem])
    end
  end

  def test_delete
    skip("Prism tests are disabled")

    response = @moderation_api.actions.delete("id")

    assert_pattern do
      response => ModerationAPI::Models::ActionDeleteResponse
    end

    assert_pattern do
      response => {
        id: String,
        deleted: ModerationAPI::Internal::Type::Boolean
      }
    end
  end
end
