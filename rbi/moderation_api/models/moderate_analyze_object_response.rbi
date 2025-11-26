# typed: strong

module ModerationAPI
  module Models
    class ModerateAnalyzeObjectResponse < ModerationAPI::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            ModerationAPI::Models::ModerateAnalyzeObjectResponse,
            ModerationAPI::Internal::AnyHash
          )
        end

      # The author of the content if your account has authors enabled. Requires you to
      # send authorId when submitting content.
      sig do
        returns(
          T.nilable(
            ModerationAPI::Models::ModerateAnalyzeObjectResponse::Author
          )
        )
      end
      attr_reader :author

      sig do
        params(
          author:
            T.nilable(
              ModerationAPI::Models::ModerateAnalyzeObjectResponse::Author::OrHash
            )
        ).void
      end
      attr_writer :author

      # Whether any entity matchers found data for the content
      sig { returns(T::Boolean) }
      attr_accessor :data_found

      # The entities found in the content
      sig do
        returns(
          T::Array[ModerationAPI::Models::ModerateAnalyzeObjectResponse::Entity]
        )
      end
      attr_accessor :entities

      # The fields in the object and their flags
      sig do
        returns(
          T::Array[ModerationAPI::Models::ModerateAnalyzeObjectResponse::Field]
        )
      end
      attr_accessor :fields

      # Whether the content was flagged by any models
      sig { returns(T::Boolean) }
      attr_accessor :flagged

      # The scores of each label
      sig do
        returns(
          T::Array[ModerationAPI::Models::ModerateAnalyzeObjectResponse::Label]
        )
      end
      attr_accessor :labels

      # Information about the request
      sig do
        returns(ModerationAPI::Models::ModerateAnalyzeObjectResponse::Request)
      end
      attr_reader :request

      sig do
        params(
          request:
            ModerationAPI::Models::ModerateAnalyzeObjectResponse::Request::OrHash
        ).void
      end
      attr_writer :request

      # Success if the request was successful
      sig { returns(String) }
      attr_accessor :status

      # Whether the content is using look-alike characters. Often used by spammers.
      sig { returns(T::Boolean) }
      attr_accessor :unicode_spoofing

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

      # The wordlist entity matcher outputs if enabled in your project. Read more at
      # https://docs.moderationapi.com/models/word
      sig do
        returns(
          T.nilable(
            T::Array[
              ModerationAPI::Models::ModerateAnalyzeObjectResponse::Wordlist
            ]
          )
        )
      end
      attr_reader :wordlists

      sig do
        params(
          wordlists:
            T::Array[
              ModerationAPI::Models::ModerateAnalyzeObjectResponse::Wordlist::OrHash
            ]
        ).void
      end
      attr_writer :wordlists

      sig do
        params(
          author:
            T.nilable(
              ModerationAPI::Models::ModerateAnalyzeObjectResponse::Author::OrHash
            ),
          data_found: T::Boolean,
          entities:
            T::Array[
              ModerationAPI::Models::ModerateAnalyzeObjectResponse::Entity::OrHash
            ],
          fields:
            T::Array[
              ModerationAPI::Models::ModerateAnalyzeObjectResponse::Field::OrHash
            ],
          flagged: T::Boolean,
          labels:
            T::Array[
              ModerationAPI::Models::ModerateAnalyzeObjectResponse::Label::OrHash
            ],
          request:
            ModerationAPI::Models::ModerateAnalyzeObjectResponse::Request::OrHash,
          status: String,
          unicode_spoofing: T::Boolean,
          content_id: String,
          error: T.anything,
          wordlists:
            T::Array[
              ModerationAPI::Models::ModerateAnalyzeObjectResponse::Wordlist::OrHash
            ]
        ).returns(T.attached_class)
      end
      def self.new(
        # The author of the content if your account has authors enabled. Requires you to
        # send authorId when submitting content.
        author:,
        # Whether any entity matchers found data for the content
        data_found:,
        # The entities found in the content
        entities:,
        # The fields in the object and their flags
        fields:,
        # Whether the content was flagged by any models
        flagged:,
        # The scores of each label
        labels:,
        # Information about the request
        request:,
        # Success if the request was successful
        status:,
        # Whether the content is using look-alike characters. Often used by spammers.
        unicode_spoofing:,
        # The ID of the content. Only returned if the content was stored.
        content_id: nil,
        # Error message if the request failed
        error: nil,
        # The wordlist entity matcher outputs if enabled in your project. Read more at
        # https://docs.moderationapi.com/models/word
        wordlists: nil
      )
      end

      sig do
        override.returns(
          {
            author:
              T.nilable(
                ModerationAPI::Models::ModerateAnalyzeObjectResponse::Author
              ),
            data_found: T::Boolean,
            entities:
              T::Array[
                ModerationAPI::Models::ModerateAnalyzeObjectResponse::Entity
              ],
            fields:
              T::Array[
                ModerationAPI::Models::ModerateAnalyzeObjectResponse::Field
              ],
            flagged: T::Boolean,
            labels:
              T::Array[
                ModerationAPI::Models::ModerateAnalyzeObjectResponse::Label
              ],
            request:
              ModerationAPI::Models::ModerateAnalyzeObjectResponse::Request,
            status: String,
            unicode_spoofing: T::Boolean,
            content_id: String,
            error: T.anything,
            wordlists:
              T::Array[
                ModerationAPI::Models::ModerateAnalyzeObjectResponse::Wordlist
              ]
          }
        )
      end
      def to_hash
      end

      class Author < ModerationAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ModerationAPI::Models::ModerateAnalyzeObjectResponse::Author,
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
              ModerationAPI::Models::ModerateAnalyzeObjectResponse::Author::Block
            )
          )
        end
        attr_reader :block

        sig do
          params(
            block:
              T.nilable(
                ModerationAPI::Models::ModerateAnalyzeObjectResponse::Author::Block::OrHash
              )
          ).void
        end
        attr_writer :block

        # Current author status
        sig do
          returns(
            ModerationAPI::Models::ModerateAnalyzeObjectResponse::Author::Status::TaggedSymbol
          )
        end
        attr_accessor :status

        sig do
          returns(
            ModerationAPI::Models::ModerateAnalyzeObjectResponse::Author::TrustLevel
          )
        end
        attr_reader :trust_level

        sig do
          params(
            trust_level:
              ModerationAPI::Models::ModerateAnalyzeObjectResponse::Author::TrustLevel::OrHash
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
                ModerationAPI::Models::ModerateAnalyzeObjectResponse::Author::Block::OrHash
              ),
            status:
              ModerationAPI::Models::ModerateAnalyzeObjectResponse::Author::Status::OrSymbol,
            trust_level:
              ModerationAPI::Models::ModerateAnalyzeObjectResponse::Author::TrustLevel::OrHash,
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
                  ModerationAPI::Models::ModerateAnalyzeObjectResponse::Author::Block
                ),
              status:
                ModerationAPI::Models::ModerateAnalyzeObjectResponse::Author::Status::TaggedSymbol,
              trust_level:
                ModerationAPI::Models::ModerateAnalyzeObjectResponse::Author::TrustLevel,
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
                ModerationAPI::Models::ModerateAnalyzeObjectResponse::Author::Block,
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
                ModerationAPI::Models::ModerateAnalyzeObjectResponse::Author::Status
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          ENABLED =
            T.let(
              :enabled,
              ModerationAPI::Models::ModerateAnalyzeObjectResponse::Author::Status::TaggedSymbol
            )
          SUSPENDED =
            T.let(
              :suspended,
              ModerationAPI::Models::ModerateAnalyzeObjectResponse::Author::Status::TaggedSymbol
            )
          BLOCKED =
            T.let(
              :blocked,
              ModerationAPI::Models::ModerateAnalyzeObjectResponse::Author::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ModerationAPI::Models::ModerateAnalyzeObjectResponse::Author::Status::TaggedSymbol
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
                ModerationAPI::Models::ModerateAnalyzeObjectResponse::Author::TrustLevel,
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

      class Entity < ModerationAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ModerationAPI::Models::ModerateAnalyzeObjectResponse::Entity,
              ModerationAPI::Internal::AnyHash
            )
          end

        # The matches of the entity
        sig { returns(T::Array[String]) }
        attr_accessor :matches

        # The model that found the entity
        sig { returns(String) }
        attr_accessor :model

        # The similarity score of the matches
        sig { returns(T.nilable(Float)) }
        attr_reader :score

        sig { params(score: Float).void }
        attr_writer :score

        sig do
          params(
            matches: T::Array[String],
            model: String,
            score: Float
          ).returns(T.attached_class)
        end
        def self.new(
          # The matches of the entity
          matches:,
          # The model that found the entity
          model:,
          # The similarity score of the matches
          score: nil
        )
        end

        sig do
          override.returns(
            { matches: T::Array[String], model: String, score: Float }
          )
        end
        def to_hash
        end
      end

      class Field < ModerationAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ModerationAPI::Models::ModerateAnalyzeObjectResponse::Field,
              ModerationAPI::Internal::AnyHash
            )
          end

        # Whether the field was flagged
        sig { returns(T::Boolean) }
        attr_accessor :flagged

        # The models that flagged the field
        sig { returns(T::Array[String]) }
        attr_accessor :flagged_by

        # The key of the field
        sig { returns(String) }
        attr_accessor :key

        sig do
          params(
            flagged: T::Boolean,
            flagged_by: T::Array[String],
            key: String
          ).returns(T.attached_class)
        end
        def self.new(
          # Whether the field was flagged
          flagged:,
          # The models that flagged the field
          flagged_by:,
          # The key of the field
          key:
        )
        end

        sig do
          override.returns(
            { flagged: T::Boolean, flagged_by: T::Array[String], key: String }
          )
        end
        def to_hash
        end
      end

      class Label < ModerationAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ModerationAPI::Models::ModerateAnalyzeObjectResponse::Label,
              ModerationAPI::Internal::AnyHash
            )
          end

        # The label of the model
        sig { returns(String) }
        attr_accessor :label

        # The model that found the label
        sig { returns(String) }
        attr_accessor :model

        # The confidence of the model
        sig { returns(Float) }
        attr_accessor :score

        sig do
          params(label: String, model: String, score: Float).returns(
            T.attached_class
          )
        end
        def self.new(
          # The label of the model
          label:,
          # The model that found the label
          model:,
          # The confidence of the model
          score:
        )
        end

        sig { override.returns({ label: String, model: String, score: Float }) }
        def to_hash
        end
      end

      class Request < ModerationAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ModerationAPI::Models::ModerateAnalyzeObjectResponse::Request,
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

      class Wordlist < ModerationAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ModerationAPI::Models::ModerateAnalyzeObjectResponse::Wordlist,
              ModerationAPI::Internal::AnyHash
            )
          end

        # The ID of the wordlist
        sig { returns(String) }
        attr_accessor :id

        # Whether the wordlists flagged the content.
        sig { returns(T::Boolean) }
        attr_accessor :flagged

        # The flagging mode.
        sig do
          returns(
            ModerationAPI::Models::ModerateAnalyzeObjectResponse::Wordlist::Mode::TaggedSymbol
          )
        end
        attr_accessor :mode

        # The name of the wordlist
        sig { returns(String) }
        attr_accessor :name

        # The score of the wordlist
        sig { returns(Float) }
        attr_accessor :score

        # The components of the matcher.
        sig { returns(T.nilable(T.anything)) }
        attr_reader :components

        sig { params(components: T.anything).void }
        attr_writer :components

        # Indicates an error with the matcher.
        sig { returns(T.nilable(String)) }
        attr_reader :error

        sig { params(error: String).void }
        attr_writer :error

        # Whether a match was found or not.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :found

        sig { params(found: T::Boolean).void }
        attr_writer :found

        # The matches of the entity matcher.
        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :matches

        sig { params(matches: T::Array[String]).void }
        attr_writer :matches

        # Indicates a warning from the model, e.g. if the text is too short or long and
        # the model might not be accurate.
        sig { returns(T.nilable(String)) }
        attr_reader :warning

        sig { params(warning: String).void }
        attr_writer :warning

        sig do
          params(
            id: String,
            flagged: T::Boolean,
            mode:
              ModerationAPI::Models::ModerateAnalyzeObjectResponse::Wordlist::Mode::OrSymbol,
            name: String,
            score: Float,
            components: T.anything,
            error: String,
            found: T::Boolean,
            matches: T::Array[String],
            warning: String
          ).returns(T.attached_class)
        end
        def self.new(
          # The ID of the wordlist
          id:,
          # Whether the wordlists flagged the content.
          flagged:,
          # The flagging mode.
          mode:,
          # The name of the wordlist
          name:,
          # The score of the wordlist
          score:,
          # The components of the matcher.
          components: nil,
          # Indicates an error with the matcher.
          error: nil,
          # Whether a match was found or not.
          found: nil,
          # The matches of the entity matcher.
          matches: nil,
          # Indicates a warning from the model, e.g. if the text is too short or long and
          # the model might not be accurate.
          warning: nil
        )
        end

        sig do
          override.returns(
            {
              id: String,
              flagged: T::Boolean,
              mode:
                ModerationAPI::Models::ModerateAnalyzeObjectResponse::Wordlist::Mode::TaggedSymbol,
              name: String,
              score: Float,
              components: T.anything,
              error: String,
              found: T::Boolean,
              matches: T::Array[String],
              warning: String
            }
          )
        end
        def to_hash
        end

        # The flagging mode.
        module Mode
          extend ModerationAPI::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                ModerationAPI::Models::ModerateAnalyzeObjectResponse::Wordlist::Mode
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          BLOCK_LIST =
            T.let(
              :BLOCK_LIST,
              ModerationAPI::Models::ModerateAnalyzeObjectResponse::Wordlist::Mode::TaggedSymbol
            )
          REQUIRE_LIST =
            T.let(
              :REQUIRE_LIST,
              ModerationAPI::Models::ModerateAnalyzeObjectResponse::Wordlist::Mode::TaggedSymbol
            )
          PASS_LIST =
            T.let(
              :PASS_LIST,
              ModerationAPI::Models::ModerateAnalyzeObjectResponse::Wordlist::Mode::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ModerationAPI::Models::ModerateAnalyzeObjectResponse::Wordlist::Mode::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
