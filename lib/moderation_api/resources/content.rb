# frozen_string_literal: true

module ModerationAPI
  module Resources
    class Content
      # Open a WebSocket to moderate live voice/call audio in real time. Speech is
      # transcribed and each finalized utterance is moderated by your enabled text
      # policies; you receive a verdict per utterance as it's spoken.
      #
      # **This is a WebSocket upgrade, not a regular HTTP call.** The request body below
      # documents the frames you _send_ over the socket; the `101` response documents
      # the events you _receive_.
      #
      # - **Auth:** `Authorization: Bearer <api_key>` on the upgrade. A missing/invalid
      #   key closes `4401`; voice not enabled on the plan/channel closes `4403`.
      # - **Subprotocol:** request `moderationapi.v1`.
      # - **Flow:** send one `start` frame, then `media` frames as audio arrives, then
      #   `stop` (or disconnect). You receive `session.started`, `utterance.final` per
      #   utterance, optional `utterance.partial`/`warning`, and `session.ended`.
      # - **Close codes:** `1000` normal · `1011` server error · `4400` bad request ·
      #   `4401` auth failed · `4403` voice not enabled · `4429` concurrency limit.
      #
      # See the
      # [Real-time voice guide](https://docs.moderationapi.com/content-moderation/real-time-voice)
      # for the full walkthrough and code examples.
      #
      # @overload stream(sec_web_socket_protocol:, request_options: {})
      #
      # @param sec_web_socket_protocol [Symbol, ModerationAPI::Models::ContentStreamParams::SecWebSocketProtocol] Requested subprotocol.
      #
      # @param request_options [ModerationAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see ModerationAPI::Models::ContentStreamParams
      def stream(params)
        parsed, options = ModerationAPI::ContentStreamParams.dump_request(params)
        path = @client.base_url_overridden? ? "stream" : "wss://voice.moderationapi.com/v1/stream"
        @client.request(
          method: :get,
          path: path,
          headers: parsed.transform_keys(sec_web_socket_protocol: "sec-websocket-protocol"),
          model: NilClass,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {ModerationAPI::Models::ContentSubmitParams} for more details.
      #
      # @overload submit(content:, author_id: nil, channel: nil, client_action: nil, content_id: nil, conversation_id: nil, do_not_store: nil, metadata: nil, meta_type: nil, policies: nil, timestamp: nil, request_options: {})
      #
      # @param content [ModerationAPI::Models::ContentSubmitParams::Content::Text, ModerationAPI::Models::ContentSubmitParams::Content::Image, ModerationAPI::Models::ContentSubmitParams::Content::Video, ModerationAPI::Models::ContentSubmitParams::Content::Audio, ModerationAPI::Models::ContentSubmitParams::Content::Object] The content sent for moderation
      #
      # @param author_id [String] The author of the content.
      #
      # @param channel [String] Provide a channel ID or key. Will use the project's default channel if not provi
      #
      # @param client_action [ModerationAPI::Models::ContentSubmitParams::ClientAction] A recommendation from your own client-side flagging (e.g. a banned-IP list or a
      #
      # @param content_id [String] The unique ID of the content in your database.
      #
      # @param conversation_id [String] For example the ID of a chat room or a post
      #
      # @param do_not_store [Boolean] Do not store the content. The content won't enter the review queue
      #
      # @param metadata [Hash{Symbol=>Object}] Any metadata you want to store with the content
      #
      # @param meta_type [Symbol, ModerationAPI::Models::ContentSubmitParams::MetaType] The meta type of content being moderated
      #
      # @param policies [Array<ModerationAPI::Models::ContentSubmitParams::Policy::Toxicity, ModerationAPI::Models::ContentSubmitParams::Policy::PersonalInformation, ModerationAPI::Models::ContentSubmitParams::Policy::ToxicitySevere, ModerationAPI::Models::ContentSubmitParams::Policy::Hate, ModerationAPI::Models::ContentSubmitParams::Policy::Illicit, ModerationAPI::Models::ContentSubmitParams::Policy::IllicitDrugs, ModerationAPI::Models::ContentSubmitParams::Policy::IllicitAlcohol, ModerationAPI::Models::ContentSubmitParams::Policy::IllicitFirearms, ModerationAPI::Models::ContentSubmitParams::Policy::IllicitTobacco, ModerationAPI::Models::ContentSubmitParams::Policy::IllicitGambling, ModerationAPI::Models::ContentSubmitParams::Policy::Cannabis, ModerationAPI::Models::ContentSubmitParams::Policy::Adult, ModerationAPI::Models::ContentSubmitParams::Policy::Crypto, ModerationAPI::Models::ContentSubmitParams::Policy::Sexual, ModerationAPI::Models::ContentSubmitParams::Policy::Flirtation, ModerationAPI::Models::ContentSubmitParams::Policy::Profanity, ModerationAPI::Models::ContentSubmitParams::Policy::Violence, ModerationAPI::Models::ContentSubmitParams::Policy::SelfHarm, ModerationAPI::Models::ContentSubmitParams::Policy::Spam, ModerationAPI::Models::ContentSubmitParams::Policy::LowQualityContent, ModerationAPI::Models::ContentSubmitParams::Policy::FaceDetection, ModerationAPI::Models::ContentSubmitParams::Policy::SelfPromotion, ModerationAPI::Models::ContentSubmitParams::Policy::Political, ModerationAPI::Models::ContentSubmitParams::Policy::Religion, ModerationAPI::Models::ContentSubmitParams::Policy::CodeAbuse, ModerationAPI::Models::ContentSubmitParams::Policy::UnicodeSpoofing, ModerationAPI::Models::ContentSubmitParams::Policy::PiiMasking, ModerationAPI::Models::ContentSubmitParams::Policy::URLMasking, ModerationAPI::Models::ContentSubmitParams::Policy::URLRisk, ModerationAPI::Models::ContentSubmitParams::Policy::Guideline>] (Enterprise) override the channel policies for this moderation request only.
      #
      # @param timestamp [Float] Unix timestamp (in milliseconds) of when the content was created. Use if content
      #
      # @param request_options [ModerationAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ModerationAPI::Models::ContentSubmitResponse]
      #
      # @see ModerationAPI::Models::ContentSubmitParams
      def submit(params)
        parsed, options = ModerationAPI::ContentSubmitParams.dump_request(params)
        @client.request(
          method: :post,
          path: "moderate",
          body: parsed,
          model: ModerationAPI::Models::ContentSubmitResponse,
          options: options
        )
      end

      # @api private
      #
      # @param client [ModerationAPI::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
