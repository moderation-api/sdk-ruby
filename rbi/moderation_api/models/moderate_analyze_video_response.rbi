# typed: strong

module ModerationAPI
  module Models
    class ModerateAnalyzeVideoResponse < ModerationAPI::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            ModerationAPI::Models::ModerateAnalyzeVideoResponse,
            ModerationAPI::Internal::AnyHash
          )
        end

      # The author of the content if your account has authors enabled. Requires you to
      # send authorId when submitting content.
      sig do
        returns(
          T.nilable(ModerationAPI::Models::ModerateAnalyzeVideoResponse::Author)
        )
      end
      attr_reader :author

      sig do
        params(
          author:
            T.nilable(
              ModerationAPI::Models::ModerateAnalyzeVideoResponse::Author::OrHash
            )
        ).void
      end
      attr_writer :author

      # Whether the content was flagged by any models
      sig { returns(T::Boolean) }
      attr_accessor :flagged

      # Information about the request
      sig do
        returns(ModerationAPI::Models::ModerateAnalyzeVideoResponse::Request)
      end
      attr_reader :request

      sig do
        params(
          request:
            ModerationAPI::Models::ModerateAnalyzeVideoResponse::Request::OrHash
        ).void
      end
      attr_writer :request

      # Success if the request was successful
      sig { returns(String) }
      attr_accessor :status

      # The ID of the content. Only returned if the content was stored.
      sig { returns(T.nilable(String)) }
      attr_reader :content_id

      sig { params(content_id: String).void }
      attr_writer :content_id

      # Error message if the request failed
      sig { returns(T.nilable(T.anything)) }
      attr_reader :error

      sig { params(error: T.anything).void }
      attr_writer :error

      sig do
        params(
          author:
            T.nilable(
              ModerationAPI::Models::ModerateAnalyzeVideoResponse::Author::OrHash
            ),
          flagged: T::Boolean,
          request:
            ModerationAPI::Models::ModerateAnalyzeVideoResponse::Request::OrHash,
          status: String,
          content_id: String,
          error: T.anything
        ).returns(T.attached_class)
      end
      def self.new(
        # The author of the content if your account has authors enabled. Requires you to
        # send authorId when submitting content.
        author:,
        # Whether the content was flagged by any models
        flagged:,
        # Information about the request
        request:,
        # Success if the request was successful
        status:,
        # The ID of the content. Only returned if the content was stored.
        content_id: nil,
        # Error message if the request failed
        error: nil
      )
      end

      sig do
        override.returns(
          {
            author:
              T.nilable(
                ModerationAPI::Models::ModerateAnalyzeVideoResponse::Author
              ),
            flagged: T::Boolean,
            request:
              ModerationAPI::Models::ModerateAnalyzeVideoResponse::Request,
            status: String,
            content_id: String,
            error: T.anything
          }
        )
      end
      def to_hash
      end

      class Author < ModerationAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ModerationAPI::Models::ModerateAnalyzeVideoResponse::Author,
              ModerationAPI::Internal::AnyHash
            )
          end

        # Author ID in Moderation API
        sig { returns(String) }
        attr_accessor :id

        # Block or suspension details, if applicable. Null if the author is enabled.
        sig do
          returns(
            T.nilable(
              ModerationAPI::Models::ModerateAnalyzeVideoResponse::Author::Block
            )
          )
        end
        attr_reader :block

        sig do
          params(
            block:
              T.nilable(
                ModerationAPI::Models::ModerateAnalyzeVideoResponse::Author::Block::OrHash
              )
          ).void
        end
        attr_writer :block

        # Current author status
        sig do
          returns(
            ModerationAPI::Models::ModerateAnalyzeVideoResponse::Author::Status::TaggedSymbol
          )
        end
        attr_accessor :status

        sig do
          returns(
            ModerationAPI::Models::ModerateAnalyzeVideoResponse::Author::TrustLevel
          )
        end
        attr_reader :trust_level

        sig do
          params(
            trust_level:
              ModerationAPI::Models::ModerateAnalyzeVideoResponse::Author::TrustLevel::OrHash
          ).void
        end
        attr_writer :trust_level

        # The author's ID from your system
        sig { returns(T.nilable(String)) }
        attr_accessor :external_id

        # The author of the content if your account has authors enabled. Requires you to
        # send authorId when submitting content.
        sig do
          params(
            id: String,
            block:
              T.nilable(
                ModerationAPI::Models::ModerateAnalyzeVideoResponse::Author::Block::OrHash
              ),
            status:
              ModerationAPI::Models::ModerateAnalyzeVideoResponse::Author::Status::OrSymbol,
            trust_level:
              ModerationAPI::Models::ModerateAnalyzeVideoResponse::Author::TrustLevel::OrHash,
            external_id: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(
          # Author ID in Moderation API
          id:,
          # Block or suspension details, if applicable. Null if the author is enabled.
          block:,
          # Current author status
          status:,
          trust_level:,
          # The author's ID from your system
          external_id: nil
        )
        end

        sig do
          override.returns(
            {
              id: String,
              block:
                T.nilable(
                  ModerationAPI::Models::ModerateAnalyzeVideoResponse::Author::Block
                ),
              status:
                ModerationAPI::Models::ModerateAnalyzeVideoResponse::Author::Status::TaggedSymbol,
              trust_level:
                ModerationAPI::Models::ModerateAnalyzeVideoResponse::Author::TrustLevel,
              external_id: T.nilable(String)
            }
          )
        end
        def to_hash
        end

        class Block < ModerationAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ModerationAPI::Models::ModerateAnalyzeVideoResponse::Author::Block,
                ModerationAPI::Internal::AnyHash
              )
            end

          # The moderators reason why the author was blocked or suspended.
          sig { returns(T.nilable(String)) }
          attr_accessor :reason

          # The timestamp until which they are blocked if the author is suspended.
          sig { returns(T.nilable(Float)) }
          attr_accessor :until_

          # Block or suspension details, if applicable. Null if the author is enabled.
          sig do
            params(reason: T.nilable(String), until_: T.nilable(Float)).returns(
              T.attached_class
            )
          end
          def self.new(
            # The moderators reason why the author was blocked or suspended.
            reason: nil,
            # The timestamp until which they are blocked if the author is suspended.
            until_: nil
          )
          end

          sig do
            override.returns(
              { reason: T.nilable(String), until_: T.nilable(Float) }
            )
          end
          def to_hash
          end
        end

        # Current author status
        module Status
          extend ModerationAPI::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                ModerationAPI::Models::ModerateAnalyzeVideoResponse::Author::Status
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          ENABLED =
            T.let(
              :enabled,
              ModerationAPI::Models::ModerateAnalyzeVideoResponse::Author::Status::TaggedSymbol
            )
          SUSPENDED =
            T.let(
              :suspended,
              ModerationAPI::Models::ModerateAnalyzeVideoResponse::Author::Status::TaggedSymbol
            )
          BLOCKED =
            T.let(
              :blocked,
              ModerationAPI::Models::ModerateAnalyzeVideoResponse::Author::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ModerationAPI::Models::ModerateAnalyzeVideoResponse::Author::Status::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        class TrustLevel < ModerationAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ModerationAPI::Models::ModerateAnalyzeVideoResponse::Author::TrustLevel,
                ModerationAPI::Internal::AnyHash
              )
            end

          # Author trust level (-1, 0, 1, 2, 3, or 4)
          sig { returns(Float) }
          attr_accessor :level

          # True if the trust level was set manually by a moderator
          sig { returns(T::Boolean) }
          attr_accessor :manual

          sig do
            params(level: Float, manual: T::Boolean).returns(T.attached_class)
          end
          def self.new(
            # Author trust level (-1, 0, 1, 2, 3, or 4)
            level:,
            # True if the trust level was set manually by a moderator
            manual:
          )
          end

          sig { override.returns({ level: Float, manual: T::Boolean }) }
          def to_hash
          end
        end
      end

      class Request < ModerationAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ModerationAPI::Models::ModerateAnalyzeVideoResponse::Request,
              ModerationAPI::Internal::AnyHash
            )
          end

        # The quota usage of the request
        sig { returns(Float) }
        attr_accessor :quota_usage

        # The timestamp of the request
        sig { returns(Float) }
        attr_accessor :timestamp

        # Information about the request
        sig do
          params(quota_usage: Float, timestamp: Float).returns(T.attached_class)
        end
        def self.new(
          # The quota usage of the request
          quota_usage:,
          # The timestamp of the request
          timestamp:
        )
        end

        sig { override.returns({ quota_usage: Float, timestamp: Float }) }
        def to_hash
        end
      end
    end
  end
end
