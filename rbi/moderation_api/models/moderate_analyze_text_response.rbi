# typed: strong

module ModerationAPI
  module Models
    class ModerateAnalyzeTextResponse < ModerationAPI::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            ModerationAPI::Models::ModerateAnalyzeTextResponse,
            ModerationAPI::Internal::AnyHash
          )
        end

      # The author of the content if your account has authors enabled. Requires you to
      # send authorId when submitting content.
      sig do
        returns(
          T.nilable(ModerationAPI::Models::ModerateAnalyzeTextResponse::Author)
        )
      end
      attr_reader :author

      sig do
        params(
          author:
            T.nilable(
              ModerationAPI::Models::ModerateAnalyzeTextResponse::Author::OrHash
            )
        ).void
      end
      attr_writer :author

      # The content after moderation. With all mask replacements applied and look-alike
      # characters replaced with the original characters.
      sig { returns(String) }
      attr_accessor :content

      # Whether the content was moderated or not. Same as `content` !== `original`
      sig { returns(T::Boolean) }
      attr_accessor :content_moderated

      # Whether any entity matchers found data for the content
      sig { returns(T::Boolean) }
      attr_accessor :data_found

      # Whether the content was flagged by any models
      sig { returns(T::Boolean) }
      attr_accessor :flagged

      # The original content
      sig { returns(String) }
      attr_accessor :original

      # Information about the request
      sig do
        returns(ModerationAPI::Models::ModerateAnalyzeTextResponse::Request)
      end
      attr_reader :request

      sig do
        params(
          request:
            ModerationAPI::Models::ModerateAnalyzeTextResponse::Request::OrHash
        ).void
      end
      attr_writer :request

      # Success if the request was successful
      sig { returns(String) }
      attr_accessor :status

      # Whether the content is using look-alike characters. Often used by spammers.
      sig { returns(T::Boolean) }
      attr_accessor :unicode_spoofing

      # The address entity matcher output if enabled in your project. Read more at
      # https://docs.moderationapi.com/models/address
      sig do
        returns(
          T.nilable(ModerationAPI::Models::ModerateAnalyzeTextResponse::Address)
        )
      end
      attr_reader :address

      sig do
        params(
          address:
            ModerationAPI::Models::ModerateAnalyzeTextResponse::Address::OrHash
        ).void
      end
      attr_writer :address

      # The ID of the content. Only returned if the content was stored.
      sig { returns(T.nilable(String)) }
      attr_reader :content_id

      sig { params(content_id: String).void }
      attr_writer :content_id

      # The email entity matcher output if enabled in your project. Read more at
      # https://docs.moderationapi.com/models/email
      sig do
        returns(
          T.nilable(ModerationAPI::Models::ModerateAnalyzeTextResponse::Email)
        )
      end
      attr_reader :email

      sig do
        params(
          email:
            ModerationAPI::Models::ModerateAnalyzeTextResponse::Email::OrHash
        ).void
      end
      attr_writer :email

      # Error message if the request failed
      sig { returns(T.nilable(T.anything)) }
      attr_reader :error

      sig { params(error: T.anything).void }
      attr_writer :error

      # The name entity matcher output if enabled in your project. Read more at
      # https://docs.moderationapi.com/models/name
      sig do
        returns(
          T.nilable(ModerationAPI::Models::ModerateAnalyzeTextResponse::Name)
        )
      end
      attr_reader :name

      sig do
        params(
          name: ModerationAPI::Models::ModerateAnalyzeTextResponse::Name::OrHash
        ).void
      end
      attr_writer :name

      # The NSFW model output if enabled in your project. Read more at
      # https://docs.moderationapi.com/models/nsfw
      sig do
        returns(
          T.nilable(ModerationAPI::Models::ModerateAnalyzeTextResponse::Nsfw)
        )
      end
      attr_reader :nsfw

      sig do
        params(
          nsfw: ModerationAPI::Models::ModerateAnalyzeTextResponse::Nsfw::OrHash
        ).void
      end
      attr_writer :nsfw

      # The phone entity matcher output if enabled in your project. Read more at
      # https://docs.moderationapi.com/models/phone
      sig do
        returns(
          T.nilable(ModerationAPI::Models::ModerateAnalyzeTextResponse::Phone)
        )
      end
      attr_reader :phone

      sig do
        params(
          phone:
            ModerationAPI::Models::ModerateAnalyzeTextResponse::Phone::OrHash
        ).void
      end
      attr_writer :phone

      # The profanity entity matcher output if enabled in your project. Read more at
      # https://docs.moderationapi.com/models/profanity
      sig do
        returns(
          T.nilable(
            ModerationAPI::Models::ModerateAnalyzeTextResponse::Profanity
          )
        )
      end
      attr_reader :profanity

      sig do
        params(
          profanity:
            ModerationAPI::Models::ModerateAnalyzeTextResponse::Profanity::OrHash
        ).void
      end
      attr_writer :profanity

      # The propriety model output if enabled in your project. Read more at
      # https://docs.moderationapi.com/models/propriety
      sig do
        returns(
          T.nilable(
            ModerationAPI::Models::ModerateAnalyzeTextResponse::Propriety
          )
        )
      end
      attr_reader :propriety

      sig do
        params(
          propriety:
            ModerationAPI::Models::ModerateAnalyzeTextResponse::Propriety::OrHash
        ).void
      end
      attr_writer :propriety

      # The spam model output if enabled in your project. Read more at
      # https://docs.moderationapi.com/models/spam
      sig do
        returns(
          T.nilable(ModerationAPI::Models::ModerateAnalyzeTextResponse::Quality)
        )
      end
      attr_reader :quality

      sig do
        params(
          quality:
            ModerationAPI::Models::ModerateAnalyzeTextResponse::Quality::OrHash
        ).void
      end
      attr_writer :quality

      # The sensitive numbers entity matcher output if enabled in your project. Read
      # more at https://docs.moderationapi.com/models/sensitive
      sig do
        returns(
          T.nilable(
            ModerationAPI::Models::ModerateAnalyzeTextResponse::Sensitive
          )
        )
      end
      attr_reader :sensitive

      sig do
        params(
          sensitive:
            ModerationAPI::Models::ModerateAnalyzeTextResponse::Sensitive::OrHash
        ).void
      end
      attr_writer :sensitive

      # The sentiment model output if enabled in your project. Read more at
      # https://docs.moderationapi.com/models/sentiment
      sig do
        returns(
          T.nilable(
            ModerationAPI::Models::ModerateAnalyzeTextResponse::Sentiment
          )
        )
      end
      attr_reader :sentiment

      sig do
        params(
          sentiment:
            ModerationAPI::Models::ModerateAnalyzeTextResponse::Sentiment::OrHash
        ).void
      end
      attr_writer :sentiment

      # The toxicity model output if enabled in your project. Read more at
      # https://docs.moderationapi.com/models/toxicity
      sig do
        returns(
          T.nilable(
            ModerationAPI::Models::ModerateAnalyzeTextResponse::Toxicity
          )
        )
      end
      attr_reader :toxicity

      sig do
        params(
          toxicity:
            ModerationAPI::Models::ModerateAnalyzeTextResponse::Toxicity::OrHash
        ).void
      end
      attr_writer :toxicity

      # The url entity matcher output if enabled in your project. Read more at
      # https://docs.moderationapi.com/models/url
      sig do
        returns(
          T.nilable(ModerationAPI::Models::ModerateAnalyzeTextResponse::URL)
        )
      end
      attr_reader :url

      sig do
        params(
          url: ModerationAPI::Models::ModerateAnalyzeTextResponse::URL::OrHash
        ).void
      end
      attr_writer :url

      # The username entity matcher output if enabled in your project. Read more at
      # https://docs.moderationapi.com/models/username
      sig do
        returns(
          T.nilable(
            ModerationAPI::Models::ModerateAnalyzeTextResponse::Username
          )
        )
      end
      attr_reader :username

      sig do
        params(
          username:
            ModerationAPI::Models::ModerateAnalyzeTextResponse::Username::OrHash
        ).void
      end
      attr_writer :username

      # The wordlist entity matcher output if enabled in your project. Read more at
      # https://docs.moderationapi.com/models/word
      sig do
        returns(
          T.nilable(
            ModerationAPI::Models::ModerateAnalyzeTextResponse::Wordlist
          )
        )
      end
      attr_reader :wordlist

      sig do
        params(
          wordlist:
            ModerationAPI::Models::ModerateAnalyzeTextResponse::Wordlist::OrHash
        ).void
      end
      attr_writer :wordlist

      # The wordlist entity matcher outputs if enabled in your project. Read more at
      # https://docs.moderationapi.com/models/word
      sig do
        returns(
          T.nilable(
            T::Array[
              ModerationAPI::Models::ModerateAnalyzeTextResponse::Wordlist
            ]
          )
        )
      end
      attr_reader :wordlists

      sig do
        params(
          wordlists:
            T::Array[
              ModerationAPI::Models::ModerateAnalyzeTextResponse::Wordlist::OrHash
            ]
        ).void
      end
      attr_writer :wordlists

      # Moderation analysis results including model outputs and detected patterns
      sig do
        params(
          author:
            T.nilable(
              ModerationAPI::Models::ModerateAnalyzeTextResponse::Author::OrHash
            ),
          content: String,
          content_moderated: T::Boolean,
          data_found: T::Boolean,
          flagged: T::Boolean,
          original: String,
          request:
            ModerationAPI::Models::ModerateAnalyzeTextResponse::Request::OrHash,
          status: String,
          unicode_spoofing: T::Boolean,
          address:
            ModerationAPI::Models::ModerateAnalyzeTextResponse::Address::OrHash,
          content_id: String,
          email:
            ModerationAPI::Models::ModerateAnalyzeTextResponse::Email::OrHash,
          error: T.anything,
          name:
            ModerationAPI::Models::ModerateAnalyzeTextResponse::Name::OrHash,
          nsfw:
            ModerationAPI::Models::ModerateAnalyzeTextResponse::Nsfw::OrHash,
          phone:
            ModerationAPI::Models::ModerateAnalyzeTextResponse::Phone::OrHash,
          profanity:
            ModerationAPI::Models::ModerateAnalyzeTextResponse::Profanity::OrHash,
          propriety:
            ModerationAPI::Models::ModerateAnalyzeTextResponse::Propriety::OrHash,
          quality:
            ModerationAPI::Models::ModerateAnalyzeTextResponse::Quality::OrHash,
          sensitive:
            ModerationAPI::Models::ModerateAnalyzeTextResponse::Sensitive::OrHash,
          sentiment:
            ModerationAPI::Models::ModerateAnalyzeTextResponse::Sentiment::OrHash,
          toxicity:
            ModerationAPI::Models::ModerateAnalyzeTextResponse::Toxicity::OrHash,
          url: ModerationAPI::Models::ModerateAnalyzeTextResponse::URL::OrHash,
          username:
            ModerationAPI::Models::ModerateAnalyzeTextResponse::Username::OrHash,
          wordlist:
            ModerationAPI::Models::ModerateAnalyzeTextResponse::Wordlist::OrHash,
          wordlists:
            T::Array[
              ModerationAPI::Models::ModerateAnalyzeTextResponse::Wordlist::OrHash
            ]
        ).returns(T.attached_class)
      end
      def self.new(
        # The author of the content if your account has authors enabled. Requires you to
        # send authorId when submitting content.
        author:,
        # The content after moderation. With all mask replacements applied and look-alike
        # characters replaced with the original characters.
        content:,
        # Whether the content was moderated or not. Same as `content` !== `original`
        content_moderated:,
        # Whether any entity matchers found data for the content
        data_found:,
        # Whether the content was flagged by any models
        flagged:,
        # The original content
        original:,
        # Information about the request
        request:,
        # Success if the request was successful
        status:,
        # Whether the content is using look-alike characters. Often used by spammers.
        unicode_spoofing:,
        # The address entity matcher output if enabled in your project. Read more at
        # https://docs.moderationapi.com/models/address
        address: nil,
        # The ID of the content. Only returned if the content was stored.
        content_id: nil,
        # The email entity matcher output if enabled in your project. Read more at
        # https://docs.moderationapi.com/models/email
        email: nil,
        # Error message if the request failed
        error: nil,
        # The name entity matcher output if enabled in your project. Read more at
        # https://docs.moderationapi.com/models/name
        name: nil,
        # The NSFW model output if enabled in your project. Read more at
        # https://docs.moderationapi.com/models/nsfw
        nsfw: nil,
        # The phone entity matcher output if enabled in your project. Read more at
        # https://docs.moderationapi.com/models/phone
        phone: nil,
        # The profanity entity matcher output if enabled in your project. Read more at
        # https://docs.moderationapi.com/models/profanity
        profanity: nil,
        # The propriety model output if enabled in your project. Read more at
        # https://docs.moderationapi.com/models/propriety
        propriety: nil,
        # The spam model output if enabled in your project. Read more at
        # https://docs.moderationapi.com/models/spam
        quality: nil,
        # The sensitive numbers entity matcher output if enabled in your project. Read
        # more at https://docs.moderationapi.com/models/sensitive
        sensitive: nil,
        # The sentiment model output if enabled in your project. Read more at
        # https://docs.moderationapi.com/models/sentiment
        sentiment: nil,
        # The toxicity model output if enabled in your project. Read more at
        # https://docs.moderationapi.com/models/toxicity
        toxicity: nil,
        # The url entity matcher output if enabled in your project. Read more at
        # https://docs.moderationapi.com/models/url
        url: nil,
        # The username entity matcher output if enabled in your project. Read more at
        # https://docs.moderationapi.com/models/username
        username: nil,
        # The wordlist entity matcher output if enabled in your project. Read more at
        # https://docs.moderationapi.com/models/word
        wordlist: nil,
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
                ModerationAPI::Models::ModerateAnalyzeTextResponse::Author
              ),
            content: String,
            content_moderated: T::Boolean,
            data_found: T::Boolean,
            flagged: T::Boolean,
            original: String,
            request:
              ModerationAPI::Models::ModerateAnalyzeTextResponse::Request,
            status: String,
            unicode_spoofing: T::Boolean,
            address:
              ModerationAPI::Models::ModerateAnalyzeTextResponse::Address,
            content_id: String,
            email: ModerationAPI::Models::ModerateAnalyzeTextResponse::Email,
            error: T.anything,
            name: ModerationAPI::Models::ModerateAnalyzeTextResponse::Name,
            nsfw: ModerationAPI::Models::ModerateAnalyzeTextResponse::Nsfw,
            phone: ModerationAPI::Models::ModerateAnalyzeTextResponse::Phone,
            profanity:
              ModerationAPI::Models::ModerateAnalyzeTextResponse::Profanity,
            propriety:
              ModerationAPI::Models::ModerateAnalyzeTextResponse::Propriety,
            quality:
              ModerationAPI::Models::ModerateAnalyzeTextResponse::Quality,
            sensitive:
              ModerationAPI::Models::ModerateAnalyzeTextResponse::Sensitive,
            sentiment:
              ModerationAPI::Models::ModerateAnalyzeTextResponse::Sentiment,
            toxicity:
              ModerationAPI::Models::ModerateAnalyzeTextResponse::Toxicity,
            url: ModerationAPI::Models::ModerateAnalyzeTextResponse::URL,
            username:
              ModerationAPI::Models::ModerateAnalyzeTextResponse::Username,
            wordlist:
              ModerationAPI::Models::ModerateAnalyzeTextResponse::Wordlist,
            wordlists:
              T::Array[
                ModerationAPI::Models::ModerateAnalyzeTextResponse::Wordlist
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
              ModerationAPI::Models::ModerateAnalyzeTextResponse::Author,
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
              ModerationAPI::Models::ModerateAnalyzeTextResponse::Author::Block
            )
          )
        end
        attr_reader :block

        sig do
          params(
            block:
              T.nilable(
                ModerationAPI::Models::ModerateAnalyzeTextResponse::Author::Block::OrHash
              )
          ).void
        end
        attr_writer :block

        # Current author status
        sig do
          returns(
            ModerationAPI::Models::ModerateAnalyzeTextResponse::Author::Status::TaggedSymbol
          )
        end
        attr_accessor :status

        sig do
          returns(
            ModerationAPI::Models::ModerateAnalyzeTextResponse::Author::TrustLevel
          )
        end
        attr_reader :trust_level

        sig do
          params(
            trust_level:
              ModerationAPI::Models::ModerateAnalyzeTextResponse::Author::TrustLevel::OrHash
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
                ModerationAPI::Models::ModerateAnalyzeTextResponse::Author::Block::OrHash
              ),
            status:
              ModerationAPI::Models::ModerateAnalyzeTextResponse::Author::Status::OrSymbol,
            trust_level:
              ModerationAPI::Models::ModerateAnalyzeTextResponse::Author::TrustLevel::OrHash,
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
                  ModerationAPI::Models::ModerateAnalyzeTextResponse::Author::Block
                ),
              status:
                ModerationAPI::Models::ModerateAnalyzeTextResponse::Author::Status::TaggedSymbol,
              trust_level:
                ModerationAPI::Models::ModerateAnalyzeTextResponse::Author::TrustLevel,
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
                ModerationAPI::Models::ModerateAnalyzeTextResponse::Author::Block,
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
                ModerationAPI::Models::ModerateAnalyzeTextResponse::Author::Status
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          ENABLED =
            T.let(
              :enabled,
              ModerationAPI::Models::ModerateAnalyzeTextResponse::Author::Status::TaggedSymbol
            )
          SUSPENDED =
            T.let(
              :suspended,
              ModerationAPI::Models::ModerateAnalyzeTextResponse::Author::Status::TaggedSymbol
            )
          BLOCKED =
            T.let(
              :blocked,
              ModerationAPI::Models::ModerateAnalyzeTextResponse::Author::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ModerationAPI::Models::ModerateAnalyzeTextResponse::Author::Status::TaggedSymbol
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
                ModerationAPI::Models::ModerateAnalyzeTextResponse::Author::TrustLevel,
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
              ModerationAPI::Models::ModerateAnalyzeTextResponse::Request,
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

      class Address < ModerationAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ModerationAPI::Models::ModerateAnalyzeTextResponse::Address,
              ModerationAPI::Internal::AnyHash
            )
          end

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

        # The detection mode.
        sig do
          returns(
            T.nilable(
              ModerationAPI::Models::ModerateAnalyzeTextResponse::Address::Mode::TaggedSymbol
            )
          )
        end
        attr_reader :mode

        sig do
          params(
            mode:
              ModerationAPI::Models::ModerateAnalyzeTextResponse::Address::Mode::OrSymbol
          ).void
        end
        attr_writer :mode

        # Indicates a warning from the model, e.g. if the text is too short or long and
        # the model might not be accurate.
        sig { returns(T.nilable(String)) }
        attr_reader :warning

        sig { params(warning: String).void }
        attr_writer :warning

        # The address entity matcher output if enabled in your project. Read more at
        # https://docs.moderationapi.com/models/address
        sig do
          params(
            components: T.anything,
            error: String,
            found: T::Boolean,
            matches: T::Array[String],
            mode:
              ModerationAPI::Models::ModerateAnalyzeTextResponse::Address::Mode::OrSymbol,
            warning: String
          ).returns(T.attached_class)
        end
        def self.new(
          # The components of the matcher.
          components: nil,
          # Indicates an error with the matcher.
          error: nil,
          # Whether a match was found or not.
          found: nil,
          # The matches of the entity matcher.
          matches: nil,
          # The detection mode.
          mode: nil,
          # Indicates a warning from the model, e.g. if the text is too short or long and
          # the model might not be accurate.
          warning: nil
        )
        end

        sig do
          override.returns(
            {
              components: T.anything,
              error: String,
              found: T::Boolean,
              matches: T::Array[String],
              mode:
                ModerationAPI::Models::ModerateAnalyzeTextResponse::Address::Mode::TaggedSymbol,
              warning: String
            }
          )
        end
        def to_hash
        end

        # The detection mode.
        module Mode
          extend ModerationAPI::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                ModerationAPI::Models::ModerateAnalyzeTextResponse::Address::Mode
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          NORMAL =
            T.let(
              :NORMAL,
              ModerationAPI::Models::ModerateAnalyzeTextResponse::Address::Mode::TaggedSymbol
            )
          SUSPICIOUS =
            T.let(
              :SUSPICIOUS,
              ModerationAPI::Models::ModerateAnalyzeTextResponse::Address::Mode::TaggedSymbol
            )
          PARANOID =
            T.let(
              :PARANOID,
              ModerationAPI::Models::ModerateAnalyzeTextResponse::Address::Mode::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ModerationAPI::Models::ModerateAnalyzeTextResponse::Address::Mode::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class Email < ModerationAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ModerationAPI::Models::ModerateAnalyzeTextResponse::Email,
              ModerationAPI::Internal::AnyHash
            )
          end

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

        # The detection mode.
        sig do
          returns(
            T.nilable(
              ModerationAPI::Models::ModerateAnalyzeTextResponse::Email::Mode::TaggedSymbol
            )
          )
        end
        attr_reader :mode

        sig do
          params(
            mode:
              ModerationAPI::Models::ModerateAnalyzeTextResponse::Email::Mode::OrSymbol
          ).void
        end
        attr_writer :mode

        # Indicates a warning from the model, e.g. if the text is too short or long and
        # the model might not be accurate.
        sig { returns(T.nilable(String)) }
        attr_reader :warning

        sig { params(warning: String).void }
        attr_writer :warning

        # The email entity matcher output if enabled in your project. Read more at
        # https://docs.moderationapi.com/models/email
        sig do
          params(
            components: T.anything,
            error: String,
            found: T::Boolean,
            matches: T::Array[String],
            mode:
              ModerationAPI::Models::ModerateAnalyzeTextResponse::Email::Mode::OrSymbol,
            warning: String
          ).returns(T.attached_class)
        end
        def self.new(
          # The components of the matcher.
          components: nil,
          # Indicates an error with the matcher.
          error: nil,
          # Whether a match was found or not.
          found: nil,
          # The matches of the entity matcher.
          matches: nil,
          # The detection mode.
          mode: nil,
          # Indicates a warning from the model, e.g. if the text is too short or long and
          # the model might not be accurate.
          warning: nil
        )
        end

        sig do
          override.returns(
            {
              components: T.anything,
              error: String,
              found: T::Boolean,
              matches: T::Array[String],
              mode:
                ModerationAPI::Models::ModerateAnalyzeTextResponse::Email::Mode::TaggedSymbol,
              warning: String
            }
          )
        end
        def to_hash
        end

        # The detection mode.
        module Mode
          extend ModerationAPI::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                ModerationAPI::Models::ModerateAnalyzeTextResponse::Email::Mode
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          NORMAL =
            T.let(
              :NORMAL,
              ModerationAPI::Models::ModerateAnalyzeTextResponse::Email::Mode::TaggedSymbol
            )
          SUSPICIOUS =
            T.let(
              :SUSPICIOUS,
              ModerationAPI::Models::ModerateAnalyzeTextResponse::Email::Mode::TaggedSymbol
            )
          PARANOID =
            T.let(
              :PARANOID,
              ModerationAPI::Models::ModerateAnalyzeTextResponse::Email::Mode::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ModerationAPI::Models::ModerateAnalyzeTextResponse::Email::Mode::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class Name < ModerationAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ModerationAPI::Models::ModerateAnalyzeTextResponse::Name,
              ModerationAPI::Internal::AnyHash
            )
          end

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

        # The detection mode.
        sig do
          returns(
            T.nilable(
              ModerationAPI::Models::ModerateAnalyzeTextResponse::Name::Mode::TaggedSymbol
            )
          )
        end
        attr_reader :mode

        sig do
          params(
            mode:
              ModerationAPI::Models::ModerateAnalyzeTextResponse::Name::Mode::OrSymbol
          ).void
        end
        attr_writer :mode

        # Indicates a warning from the model, e.g. if the text is too short or long and
        # the model might not be accurate.
        sig { returns(T.nilable(String)) }
        attr_reader :warning

        sig { params(warning: String).void }
        attr_writer :warning

        # The name entity matcher output if enabled in your project. Read more at
        # https://docs.moderationapi.com/models/name
        sig do
          params(
            components: T.anything,
            error: String,
            found: T::Boolean,
            matches: T::Array[String],
            mode:
              ModerationAPI::Models::ModerateAnalyzeTextResponse::Name::Mode::OrSymbol,
            warning: String
          ).returns(T.attached_class)
        end
        def self.new(
          # The components of the matcher.
          components: nil,
          # Indicates an error with the matcher.
          error: nil,
          # Whether a match was found or not.
          found: nil,
          # The matches of the entity matcher.
          matches: nil,
          # The detection mode.
          mode: nil,
          # Indicates a warning from the model, e.g. if the text is too short or long and
          # the model might not be accurate.
          warning: nil
        )
        end

        sig do
          override.returns(
            {
              components: T.anything,
              error: String,
              found: T::Boolean,
              matches: T::Array[String],
              mode:
                ModerationAPI::Models::ModerateAnalyzeTextResponse::Name::Mode::TaggedSymbol,
              warning: String
            }
          )
        end
        def to_hash
        end

        # The detection mode.
        module Mode
          extend ModerationAPI::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                ModerationAPI::Models::ModerateAnalyzeTextResponse::Name::Mode
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          NORMAL =
            T.let(
              :NORMAL,
              ModerationAPI::Models::ModerateAnalyzeTextResponse::Name::Mode::TaggedSymbol
            )
          SUSPICIOUS =
            T.let(
              :SUSPICIOUS,
              ModerationAPI::Models::ModerateAnalyzeTextResponse::Name::Mode::TaggedSymbol
            )
          PARANOID =
            T.let(
              :PARANOID,
              ModerationAPI::Models::ModerateAnalyzeTextResponse::Name::Mode::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ModerationAPI::Models::ModerateAnalyzeTextResponse::Name::Mode::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class Nsfw < ModerationAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ModerationAPI::Models::ModerateAnalyzeTextResponse::Nsfw,
              ModerationAPI::Internal::AnyHash
            )
          end

        # Indicates an error with the model
        sig { returns(T.nilable(String)) }
        attr_reader :error

        sig { params(error: String).void }
        attr_writer :error

        # The label of the model
        sig { returns(T.nilable(String)) }
        attr_reader :label

        sig { params(label: String).void }
        attr_writer :label

        # The confidence of all labels
        sig do
          returns(
            T.nilable(
              ModerationAPI::Models::ModerateAnalyzeTextResponse::Nsfw::LabelScores
            )
          )
        end
        attr_reader :label_scores

        sig do
          params(
            label_scores:
              ModerationAPI::Models::ModerateAnalyzeTextResponse::Nsfw::LabelScores::OrHash
          ).void
        end
        attr_writer :label_scores

        # The confidence of the model
        sig { returns(T.nilable(Float)) }
        attr_reader :score

        sig { params(score: Float).void }
        attr_writer :score

        # Indicates a warning from the model, e.g. if the text is too short or long and
        # the model might not be accurate
        sig { returns(T.nilable(String)) }
        attr_reader :warning

        sig { params(warning: String).void }
        attr_writer :warning

        # The NSFW model output if enabled in your project. Read more at
        # https://docs.moderationapi.com/models/nsfw
        sig do
          params(
            error: String,
            label: String,
            label_scores:
              ModerationAPI::Models::ModerateAnalyzeTextResponse::Nsfw::LabelScores::OrHash,
            score: Float,
            warning: String
          ).returns(T.attached_class)
        end
        def self.new(
          # Indicates an error with the model
          error: nil,
          # The label of the model
          label: nil,
          # The confidence of all labels
          label_scores: nil,
          # The confidence of the model
          score: nil,
          # Indicates a warning from the model, e.g. if the text is too short or long and
          # the model might not be accurate
          warning: nil
        )
        end

        sig do
          override.returns(
            {
              error: String,
              label: String,
              label_scores:
                ModerationAPI::Models::ModerateAnalyzeTextResponse::Nsfw::LabelScores,
              score: Float,
              warning: String
            }
          )
        end
        def to_hash
        end

        class LabelScores < ModerationAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ModerationAPI::Models::ModerateAnalyzeTextResponse::Nsfw::LabelScores,
                ModerationAPI::Internal::AnyHash
              )
            end

          sig { returns(T.nilable(Float)) }
          attr_reader :neutral

          sig { params(neutral: Float).void }
          attr_writer :neutral

          # Mentions religion, politics, race, etc., but is neutral or positive.
          sig { returns(T.nilable(Float)) }
          attr_reader :sensitive

          sig { params(sensitive: Float).void }
          attr_writer :sensitive

          # Sexual, hateful, profane, and inappropriate content.
          sig { returns(T.nilable(Float)) }
          attr_reader :unsafe

          sig { params(unsafe: Float).void }
          attr_writer :unsafe

          # The confidence of all labels
          sig do
            params(neutral: Float, sensitive: Float, unsafe: Float).returns(
              T.attached_class
            )
          end
          def self.new(
            neutral: nil,
            # Mentions religion, politics, race, etc., but is neutral or positive.
            sensitive: nil,
            # Sexual, hateful, profane, and inappropriate content.
            unsafe: nil
          )
          end

          sig do
            override.returns(
              { neutral: Float, sensitive: Float, unsafe: Float }
            )
          end
          def to_hash
          end
        end
      end

      class Phone < ModerationAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ModerationAPI::Models::ModerateAnalyzeTextResponse::Phone,
              ModerationAPI::Internal::AnyHash
            )
          end

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

        # The detection mode.
        sig do
          returns(
            T.nilable(
              ModerationAPI::Models::ModerateAnalyzeTextResponse::Phone::Mode::TaggedSymbol
            )
          )
        end
        attr_reader :mode

        sig do
          params(
            mode:
              ModerationAPI::Models::ModerateAnalyzeTextResponse::Phone::Mode::OrSymbol
          ).void
        end
        attr_writer :mode

        # Indicates a warning from the model, e.g. if the text is too short or long and
        # the model might not be accurate.
        sig { returns(T.nilable(String)) }
        attr_reader :warning

        sig { params(warning: String).void }
        attr_writer :warning

        # The phone entity matcher output if enabled in your project. Read more at
        # https://docs.moderationapi.com/models/phone
        sig do
          params(
            components: T.anything,
            error: String,
            found: T::Boolean,
            matches: T::Array[String],
            mode:
              ModerationAPI::Models::ModerateAnalyzeTextResponse::Phone::Mode::OrSymbol,
            warning: String
          ).returns(T.attached_class)
        end
        def self.new(
          # The components of the matcher.
          components: nil,
          # Indicates an error with the matcher.
          error: nil,
          # Whether a match was found or not.
          found: nil,
          # The matches of the entity matcher.
          matches: nil,
          # The detection mode.
          mode: nil,
          # Indicates a warning from the model, e.g. if the text is too short or long and
          # the model might not be accurate.
          warning: nil
        )
        end

        sig do
          override.returns(
            {
              components: T.anything,
              error: String,
              found: T::Boolean,
              matches: T::Array[String],
              mode:
                ModerationAPI::Models::ModerateAnalyzeTextResponse::Phone::Mode::TaggedSymbol,
              warning: String
            }
          )
        end
        def to_hash
        end

        # The detection mode.
        module Mode
          extend ModerationAPI::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                ModerationAPI::Models::ModerateAnalyzeTextResponse::Phone::Mode
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          NORMAL =
            T.let(
              :NORMAL,
              ModerationAPI::Models::ModerateAnalyzeTextResponse::Phone::Mode::TaggedSymbol
            )
          SUSPICIOUS =
            T.let(
              :SUSPICIOUS,
              ModerationAPI::Models::ModerateAnalyzeTextResponse::Phone::Mode::TaggedSymbol
            )
          PARANOID =
            T.let(
              :PARANOID,
              ModerationAPI::Models::ModerateAnalyzeTextResponse::Phone::Mode::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ModerationAPI::Models::ModerateAnalyzeTextResponse::Phone::Mode::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class Profanity < ModerationAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ModerationAPI::Models::ModerateAnalyzeTextResponse::Profanity,
              ModerationAPI::Internal::AnyHash
            )
          end

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

        # The detection mode.
        sig do
          returns(
            T.nilable(
              ModerationAPI::Models::ModerateAnalyzeTextResponse::Profanity::Mode::TaggedSymbol
            )
          )
        end
        attr_reader :mode

        sig do
          params(
            mode:
              ModerationAPI::Models::ModerateAnalyzeTextResponse::Profanity::Mode::OrSymbol
          ).void
        end
        attr_writer :mode

        # Indicates a warning from the model, e.g. if the text is too short or long and
        # the model might not be accurate.
        sig { returns(T.nilable(String)) }
        attr_reader :warning

        sig { params(warning: String).void }
        attr_writer :warning

        # The profanity entity matcher output if enabled in your project. Read more at
        # https://docs.moderationapi.com/models/profanity
        sig do
          params(
            components: T.anything,
            error: String,
            found: T::Boolean,
            matches: T::Array[String],
            mode:
              ModerationAPI::Models::ModerateAnalyzeTextResponse::Profanity::Mode::OrSymbol,
            warning: String
          ).returns(T.attached_class)
        end
        def self.new(
          # The components of the matcher.
          components: nil,
          # Indicates an error with the matcher.
          error: nil,
          # Whether a match was found or not.
          found: nil,
          # The matches of the entity matcher.
          matches: nil,
          # The detection mode.
          mode: nil,
          # Indicates a warning from the model, e.g. if the text is too short or long and
          # the model might not be accurate.
          warning: nil
        )
        end

        sig do
          override.returns(
            {
              components: T.anything,
              error: String,
              found: T::Boolean,
              matches: T::Array[String],
              mode:
                ModerationAPI::Models::ModerateAnalyzeTextResponse::Profanity::Mode::TaggedSymbol,
              warning: String
            }
          )
        end
        def to_hash
        end

        # The detection mode.
        module Mode
          extend ModerationAPI::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                ModerationAPI::Models::ModerateAnalyzeTextResponse::Profanity::Mode
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          NORMAL =
            T.let(
              :NORMAL,
              ModerationAPI::Models::ModerateAnalyzeTextResponse::Profanity::Mode::TaggedSymbol
            )
          SUSPICIOUS =
            T.let(
              :SUSPICIOUS,
              ModerationAPI::Models::ModerateAnalyzeTextResponse::Profanity::Mode::TaggedSymbol
            )
          PARANOID =
            T.let(
              :PARANOID,
              ModerationAPI::Models::ModerateAnalyzeTextResponse::Profanity::Mode::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ModerationAPI::Models::ModerateAnalyzeTextResponse::Profanity::Mode::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class Propriety < ModerationAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ModerationAPI::Models::ModerateAnalyzeTextResponse::Propriety,
              ModerationAPI::Internal::AnyHash
            )
          end

        # Indicates an error with the model
        sig { returns(T.nilable(String)) }
        attr_reader :error

        sig { params(error: String).void }
        attr_writer :error

        # The label of the model
        sig { returns(T.nilable(String)) }
        attr_reader :label

        sig { params(label: String).void }
        attr_writer :label

        # The confidence of all labels
        sig do
          returns(
            T.nilable(
              ModerationAPI::Models::ModerateAnalyzeTextResponse::Propriety::LabelScores
            )
          )
        end
        attr_reader :label_scores

        sig do
          params(
            label_scores:
              ModerationAPI::Models::ModerateAnalyzeTextResponse::Propriety::LabelScores::OrHash
          ).void
        end
        attr_writer :label_scores

        # The confidence of the model
        sig { returns(T.nilable(Float)) }
        attr_reader :score

        sig { params(score: Float).void }
        attr_writer :score

        # Indicates a warning from the model, e.g. if the text is too short or long and
        # the model might not be accurate
        sig { returns(T.nilable(String)) }
        attr_reader :warning

        sig { params(warning: String).void }
        attr_writer :warning

        # The propriety model output if enabled in your project. Read more at
        # https://docs.moderationapi.com/models/propriety
        sig do
          params(
            error: String,
            label: String,
            label_scores:
              ModerationAPI::Models::ModerateAnalyzeTextResponse::Propriety::LabelScores::OrHash,
            score: Float,
            warning: String
          ).returns(T.attached_class)
        end
        def self.new(
          # Indicates an error with the model
          error: nil,
          # The label of the model
          label: nil,
          # The confidence of all labels
          label_scores: nil,
          # The confidence of the model
          score: nil,
          # Indicates a warning from the model, e.g. if the text is too short or long and
          # the model might not be accurate
          warning: nil
        )
        end

        sig do
          override.returns(
            {
              error: String,
              label: String,
              label_scores:
                ModerationAPI::Models::ModerateAnalyzeTextResponse::Propriety::LabelScores,
              score: Float,
              warning: String
            }
          )
        end
        def to_hash
        end

        class LabelScores < ModerationAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ModerationAPI::Models::ModerateAnalyzeTextResponse::Propriety::LabelScores,
                ModerationAPI::Internal::AnyHash
              )
            end

          # Pickup lines, compliments on appearance, etc.
          sig { returns(T.nilable(Float)) }
          attr_reader :flirtation

          sig { params(flirtation: Float).void }
          attr_writer :flirtation

          sig { returns(T.nilable(Float)) }
          attr_reader :neutral

          sig { params(neutral: Float).void }
          attr_writer :neutral

          # References to sexual acts, body parts, etc.
          sig { returns(T.nilable(Float)) }
          attr_reader :sexually_explicit

          sig { params(sexually_explicit: Float).void }
          attr_writer :sexually_explicit

          # The confidence of all labels
          sig do
            params(
              flirtation: Float,
              neutral: Float,
              sexually_explicit: Float
            ).returns(T.attached_class)
          end
          def self.new(
            # Pickup lines, compliments on appearance, etc.
            flirtation: nil,
            neutral: nil,
            # References to sexual acts, body parts, etc.
            sexually_explicit: nil
          )
          end

          sig do
            override.returns(
              { flirtation: Float, neutral: Float, sexually_explicit: Float }
            )
          end
          def to_hash
          end
        end
      end

      class Quality < ModerationAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ModerationAPI::Models::ModerateAnalyzeTextResponse::Quality,
              ModerationAPI::Internal::AnyHash
            )
          end

        # Indicates an error with the model
        sig { returns(T.nilable(String)) }
        attr_reader :error

        sig { params(error: String).void }
        attr_writer :error

        # The label of the model
        sig { returns(T.nilable(String)) }
        attr_reader :label

        sig { params(label: String).void }
        attr_writer :label

        # The confidence of all labels
        sig do
          returns(
            T.nilable(
              ModerationAPI::Models::ModerateAnalyzeTextResponse::Quality::LabelScores
            )
          )
        end
        attr_reader :label_scores

        sig do
          params(
            label_scores:
              ModerationAPI::Models::ModerateAnalyzeTextResponse::Quality::LabelScores::OrHash
          ).void
        end
        attr_writer :label_scores

        # The confidence of the model
        sig { returns(T.nilable(Float)) }
        attr_reader :score

        sig { params(score: Float).void }
        attr_writer :score

        # Indicates a warning from the model, e.g. if the text is too short or long and
        # the model might not be accurate
        sig { returns(T.nilable(String)) }
        attr_reader :warning

        sig { params(warning: String).void }
        attr_writer :warning

        # The spam model output if enabled in your project. Read more at
        # https://docs.moderationapi.com/models/spam
        sig do
          params(
            error: String,
            label: String,
            label_scores:
              ModerationAPI::Models::ModerateAnalyzeTextResponse::Quality::LabelScores::OrHash,
            score: Float,
            warning: String
          ).returns(T.attached_class)
        end
        def self.new(
          # Indicates an error with the model
          error: nil,
          # The label of the model
          label: nil,
          # The confidence of all labels
          label_scores: nil,
          # The confidence of the model
          score: nil,
          # Indicates a warning from the model, e.g. if the text is too short or long and
          # the model might not be accurate
          warning: nil
        )
        end

        sig do
          override.returns(
            {
              error: String,
              label: String,
              label_scores:
                ModerationAPI::Models::ModerateAnalyzeTextResponse::Quality::LabelScores,
              score: Float,
              warning: String
            }
          )
        end
        def to_hash
        end

        class LabelScores < ModerationAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ModerationAPI::Models::ModerateAnalyzeTextResponse::Quality::LabelScores,
                ModerationAPI::Internal::AnyHash
              )
            end

          # Difficult to understand, nonsensical.
          sig { returns(T.nilable(Float)) }
          attr_reader :incoherent

          sig { params(incoherent: Float).void }
          attr_writer :incoherent

          sig { returns(T.nilable(Float)) }
          attr_reader :neutral

          sig { params(neutral: Float).void }
          attr_writer :neutral

          # Irrelevant and unsolicited commercial content.
          sig { returns(T.nilable(Float)) }
          attr_reader :spam

          sig { params(spam: Float).void }
          attr_writer :spam

          # Trivial or short content.
          sig { returns(T.nilable(Float)) }
          attr_reader :unsubstantial

          sig { params(unsubstantial: Float).void }
          attr_writer :unsubstantial

          # The confidence of all labels
          sig do
            params(
              incoherent: Float,
              neutral: Float,
              spam: Float,
              unsubstantial: Float
            ).returns(T.attached_class)
          end
          def self.new(
            # Difficult to understand, nonsensical.
            incoherent: nil,
            neutral: nil,
            # Irrelevant and unsolicited commercial content.
            spam: nil,
            # Trivial or short content.
            unsubstantial: nil
          )
          end

          sig do
            override.returns(
              {
                incoherent: Float,
                neutral: Float,
                spam: Float,
                unsubstantial: Float
              }
            )
          end
          def to_hash
          end
        end
      end

      class Sensitive < ModerationAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ModerationAPI::Models::ModerateAnalyzeTextResponse::Sensitive,
              ModerationAPI::Internal::AnyHash
            )
          end

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

        # The detection mode.
        sig do
          returns(
            T.nilable(
              ModerationAPI::Models::ModerateAnalyzeTextResponse::Sensitive::Mode::TaggedSymbol
            )
          )
        end
        attr_reader :mode

        sig do
          params(
            mode:
              ModerationAPI::Models::ModerateAnalyzeTextResponse::Sensitive::Mode::OrSymbol
          ).void
        end
        attr_writer :mode

        # Indicates a warning from the model, e.g. if the text is too short or long and
        # the model might not be accurate.
        sig { returns(T.nilable(String)) }
        attr_reader :warning

        sig { params(warning: String).void }
        attr_writer :warning

        # The sensitive numbers entity matcher output if enabled in your project. Read
        # more at https://docs.moderationapi.com/models/sensitive
        sig do
          params(
            components: T.anything,
            error: String,
            found: T::Boolean,
            matches: T::Array[String],
            mode:
              ModerationAPI::Models::ModerateAnalyzeTextResponse::Sensitive::Mode::OrSymbol,
            warning: String
          ).returns(T.attached_class)
        end
        def self.new(
          # The components of the matcher.
          components: nil,
          # Indicates an error with the matcher.
          error: nil,
          # Whether a match was found or not.
          found: nil,
          # The matches of the entity matcher.
          matches: nil,
          # The detection mode.
          mode: nil,
          # Indicates a warning from the model, e.g. if the text is too short or long and
          # the model might not be accurate.
          warning: nil
        )
        end

        sig do
          override.returns(
            {
              components: T.anything,
              error: String,
              found: T::Boolean,
              matches: T::Array[String],
              mode:
                ModerationAPI::Models::ModerateAnalyzeTextResponse::Sensitive::Mode::TaggedSymbol,
              warning: String
            }
          )
        end
        def to_hash
        end

        # The detection mode.
        module Mode
          extend ModerationAPI::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                ModerationAPI::Models::ModerateAnalyzeTextResponse::Sensitive::Mode
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          NORMAL =
            T.let(
              :NORMAL,
              ModerationAPI::Models::ModerateAnalyzeTextResponse::Sensitive::Mode::TaggedSymbol
            )
          SUSPICIOUS =
            T.let(
              :SUSPICIOUS,
              ModerationAPI::Models::ModerateAnalyzeTextResponse::Sensitive::Mode::TaggedSymbol
            )
          PARANOID =
            T.let(
              :PARANOID,
              ModerationAPI::Models::ModerateAnalyzeTextResponse::Sensitive::Mode::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ModerationAPI::Models::ModerateAnalyzeTextResponse::Sensitive::Mode::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class Sentiment < ModerationAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ModerationAPI::Models::ModerateAnalyzeTextResponse::Sentiment,
              ModerationAPI::Internal::AnyHash
            )
          end

        # Indicates an error with the model
        sig { returns(T.nilable(String)) }
        attr_reader :error

        sig { params(error: String).void }
        attr_writer :error

        # The label of the model
        sig { returns(T.nilable(String)) }
        attr_reader :label

        sig { params(label: String).void }
        attr_writer :label

        # The confidence of all labels
        sig do
          returns(
            T.nilable(
              ModerationAPI::Models::ModerateAnalyzeTextResponse::Sentiment::LabelScores
            )
          )
        end
        attr_reader :label_scores

        sig do
          params(
            label_scores:
              ModerationAPI::Models::ModerateAnalyzeTextResponse::Sentiment::LabelScores::OrHash
          ).void
        end
        attr_writer :label_scores

        # The confidence of the model
        sig { returns(T.nilable(Float)) }
        attr_reader :score

        sig { params(score: Float).void }
        attr_writer :score

        # Indicates a warning from the model, e.g. if the text is too short or long and
        # the model might not be accurate
        sig { returns(T.nilable(String)) }
        attr_reader :warning

        sig { params(warning: String).void }
        attr_writer :warning

        # The sentiment model output if enabled in your project. Read more at
        # https://docs.moderationapi.com/models/sentiment
        sig do
          params(
            error: String,
            label: String,
            label_scores:
              ModerationAPI::Models::ModerateAnalyzeTextResponse::Sentiment::LabelScores::OrHash,
            score: Float,
            warning: String
          ).returns(T.attached_class)
        end
        def self.new(
          # Indicates an error with the model
          error: nil,
          # The label of the model
          label: nil,
          # The confidence of all labels
          label_scores: nil,
          # The confidence of the model
          score: nil,
          # Indicates a warning from the model, e.g. if the text is too short or long and
          # the model might not be accurate
          warning: nil
        )
        end

        sig do
          override.returns(
            {
              error: String,
              label: String,
              label_scores:
                ModerationAPI::Models::ModerateAnalyzeTextResponse::Sentiment::LabelScores,
              score: Float,
              warning: String
            }
          )
        end
        def to_hash
        end

        class LabelScores < ModerationAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ModerationAPI::Models::ModerateAnalyzeTextResponse::Sentiment::LabelScores,
                ModerationAPI::Internal::AnyHash
              )
            end

          # Negative sentiment.
          sig { returns(T.nilable(Float)) }
          attr_reader :negative

          sig { params(negative: Float).void }
          attr_writer :negative

          sig { returns(T.nilable(Float)) }
          attr_reader :neutral

          sig { params(neutral: Float).void }
          attr_writer :neutral

          # Positive sentiment.
          sig { returns(T.nilable(Float)) }
          attr_reader :positive

          sig { params(positive: Float).void }
          attr_writer :positive

          # The confidence of all labels
          sig do
            params(negative: Float, neutral: Float, positive: Float).returns(
              T.attached_class
            )
          end
          def self.new(
            # Negative sentiment.
            negative: nil,
            neutral: nil,
            # Positive sentiment.
            positive: nil
          )
          end

          sig do
            override.returns(
              { negative: Float, neutral: Float, positive: Float }
            )
          end
          def to_hash
          end
        end
      end

      class Toxicity < ModerationAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ModerationAPI::Models::ModerateAnalyzeTextResponse::Toxicity,
              ModerationAPI::Internal::AnyHash
            )
          end

        # Indicates an error with the model
        sig { returns(T.nilable(String)) }
        attr_reader :error

        sig { params(error: String).void }
        attr_writer :error

        # The label of the model
        sig { returns(T.nilable(String)) }
        attr_reader :label

        sig { params(label: String).void }
        attr_writer :label

        # The confidence of all labels
        sig do
          returns(
            T.nilable(
              ModerationAPI::Models::ModerateAnalyzeTextResponse::Toxicity::LabelScores
            )
          )
        end
        attr_reader :label_scores

        sig do
          params(
            label_scores:
              ModerationAPI::Models::ModerateAnalyzeTextResponse::Toxicity::LabelScores::OrHash
          ).void
        end
        attr_writer :label_scores

        # The confidence of the model
        sig { returns(T.nilable(Float)) }
        attr_reader :score

        sig { params(score: Float).void }
        attr_writer :score

        # Indicates a warning from the model, e.g. if the text is too short or long and
        # the model might not be accurate
        sig { returns(T.nilable(String)) }
        attr_reader :warning

        sig { params(warning: String).void }
        attr_writer :warning

        # The toxicity model output if enabled in your project. Read more at
        # https://docs.moderationapi.com/models/toxicity
        sig do
          params(
            error: String,
            label: String,
            label_scores:
              ModerationAPI::Models::ModerateAnalyzeTextResponse::Toxicity::LabelScores::OrHash,
            score: Float,
            warning: String
          ).returns(T.attached_class)
        end
        def self.new(
          # Indicates an error with the model
          error: nil,
          # The label of the model
          label: nil,
          # The confidence of all labels
          label_scores: nil,
          # The confidence of the model
          score: nil,
          # Indicates a warning from the model, e.g. if the text is too short or long and
          # the model might not be accurate
          warning: nil
        )
        end

        sig do
          override.returns(
            {
              error: String,
              label: String,
              label_scores:
                ModerationAPI::Models::ModerateAnalyzeTextResponse::Toxicity::LabelScores,
              score: Float,
              warning: String
            }
          )
        end
        def to_hash
        end

        class LabelScores < ModerationAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ModerationAPI::Models::ModerateAnalyzeTextResponse::Toxicity::LabelScores,
                ModerationAPI::Internal::AnyHash
              )
            end

          # Discrimination of race, religion, gender, etc.
          sig { returns(T.nilable(Float)) }
          attr_reader :discrimination

          sig { params(discrimination: Float).void }
          attr_writer :discrimination

          # Negative comments about looks or personality etc.
          sig { returns(T.nilable(Float)) }
          attr_reader :insult

          sig { params(insult: Float).void }
          attr_writer :insult

          sig { returns(T.nilable(Float)) }
          attr_reader :neutral

          sig { params(neutral: Float).void }
          attr_writer :neutral

          # Swearing, curse words, and other obscene language.
          sig { returns(T.nilable(Float)) }
          attr_reader :profanity

          sig { params(profanity: Float).void }
          attr_writer :profanity

          # Very hateful and aggressive content.
          sig { returns(T.nilable(Float)) }
          attr_reader :severe_toxicity

          sig { params(severe_toxicity: Float).void }
          attr_writer :severe_toxicity

          # Content containing intention to harm or violence.
          sig { returns(T.nilable(Float)) }
          attr_reader :threat

          sig { params(threat: Float).void }
          attr_writer :threat

          # Rude or disrespectful content.
          sig { returns(T.nilable(Float)) }
          attr_reader :toxicity

          sig { params(toxicity: Float).void }
          attr_writer :toxicity

          # The confidence of all labels
          sig do
            params(
              discrimination: Float,
              insult: Float,
              neutral: Float,
              profanity: Float,
              severe_toxicity: Float,
              threat: Float,
              toxicity: Float
            ).returns(T.attached_class)
          end
          def self.new(
            # Discrimination of race, religion, gender, etc.
            discrimination: nil,
            # Negative comments about looks or personality etc.
            insult: nil,
            neutral: nil,
            # Swearing, curse words, and other obscene language.
            profanity: nil,
            # Very hateful and aggressive content.
            severe_toxicity: nil,
            # Content containing intention to harm or violence.
            threat: nil,
            # Rude or disrespectful content.
            toxicity: nil
          )
          end

          sig do
            override.returns(
              {
                discrimination: Float,
                insult: Float,
                neutral: Float,
                profanity: Float,
                severe_toxicity: Float,
                threat: Float,
                toxicity: Float
              }
            )
          end
          def to_hash
          end
        end
      end

      class URL < ModerationAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ModerationAPI::Models::ModerateAnalyzeTextResponse::URL,
              ModerationAPI::Internal::AnyHash
            )
          end

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

        # The detection mode.
        sig do
          returns(
            T.nilable(
              ModerationAPI::Models::ModerateAnalyzeTextResponse::URL::Mode::TaggedSymbol
            )
          )
        end
        attr_reader :mode

        sig do
          params(
            mode:
              ModerationAPI::Models::ModerateAnalyzeTextResponse::URL::Mode::OrSymbol
          ).void
        end
        attr_writer :mode

        # Indicates a warning from the model, e.g. if the text is too short or long and
        # the model might not be accurate.
        sig { returns(T.nilable(String)) }
        attr_reader :warning

        sig { params(warning: String).void }
        attr_writer :warning

        # The url entity matcher output if enabled in your project. Read more at
        # https://docs.moderationapi.com/models/url
        sig do
          params(
            components: T.anything,
            error: String,
            found: T::Boolean,
            matches: T::Array[String],
            mode:
              ModerationAPI::Models::ModerateAnalyzeTextResponse::URL::Mode::OrSymbol,
            warning: String
          ).returns(T.attached_class)
        end
        def self.new(
          # The components of the matcher.
          components: nil,
          # Indicates an error with the matcher.
          error: nil,
          # Whether a match was found or not.
          found: nil,
          # The matches of the entity matcher.
          matches: nil,
          # The detection mode.
          mode: nil,
          # Indicates a warning from the model, e.g. if the text is too short or long and
          # the model might not be accurate.
          warning: nil
        )
        end

        sig do
          override.returns(
            {
              components: T.anything,
              error: String,
              found: T::Boolean,
              matches: T::Array[String],
              mode:
                ModerationAPI::Models::ModerateAnalyzeTextResponse::URL::Mode::TaggedSymbol,
              warning: String
            }
          )
        end
        def to_hash
        end

        # The detection mode.
        module Mode
          extend ModerationAPI::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                ModerationAPI::Models::ModerateAnalyzeTextResponse::URL::Mode
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          NORMAL =
            T.let(
              :NORMAL,
              ModerationAPI::Models::ModerateAnalyzeTextResponse::URL::Mode::TaggedSymbol
            )
          SUSPICIOUS =
            T.let(
              :SUSPICIOUS,
              ModerationAPI::Models::ModerateAnalyzeTextResponse::URL::Mode::TaggedSymbol
            )
          PARANOID =
            T.let(
              :PARANOID,
              ModerationAPI::Models::ModerateAnalyzeTextResponse::URL::Mode::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ModerationAPI::Models::ModerateAnalyzeTextResponse::URL::Mode::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class Username < ModerationAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ModerationAPI::Models::ModerateAnalyzeTextResponse::Username,
              ModerationAPI::Internal::AnyHash
            )
          end

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

        # The detection mode.
        sig do
          returns(
            T.nilable(
              ModerationAPI::Models::ModerateAnalyzeTextResponse::Username::Mode::TaggedSymbol
            )
          )
        end
        attr_reader :mode

        sig do
          params(
            mode:
              ModerationAPI::Models::ModerateAnalyzeTextResponse::Username::Mode::OrSymbol
          ).void
        end
        attr_writer :mode

        # Indicates a warning from the model, e.g. if the text is too short or long and
        # the model might not be accurate.
        sig { returns(T.nilable(String)) }
        attr_reader :warning

        sig { params(warning: String).void }
        attr_writer :warning

        # The username entity matcher output if enabled in your project. Read more at
        # https://docs.moderationapi.com/models/username
        sig do
          params(
            components: T.anything,
            error: String,
            found: T::Boolean,
            matches: T::Array[String],
            mode:
              ModerationAPI::Models::ModerateAnalyzeTextResponse::Username::Mode::OrSymbol,
            warning: String
          ).returns(T.attached_class)
        end
        def self.new(
          # The components of the matcher.
          components: nil,
          # Indicates an error with the matcher.
          error: nil,
          # Whether a match was found or not.
          found: nil,
          # The matches of the entity matcher.
          matches: nil,
          # The detection mode.
          mode: nil,
          # Indicates a warning from the model, e.g. if the text is too short or long and
          # the model might not be accurate.
          warning: nil
        )
        end

        sig do
          override.returns(
            {
              components: T.anything,
              error: String,
              found: T::Boolean,
              matches: T::Array[String],
              mode:
                ModerationAPI::Models::ModerateAnalyzeTextResponse::Username::Mode::TaggedSymbol,
              warning: String
            }
          )
        end
        def to_hash
        end

        # The detection mode.
        module Mode
          extend ModerationAPI::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                ModerationAPI::Models::ModerateAnalyzeTextResponse::Username::Mode
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          NORMAL =
            T.let(
              :NORMAL,
              ModerationAPI::Models::ModerateAnalyzeTextResponse::Username::Mode::TaggedSymbol
            )
          SUSPICIOUS =
            T.let(
              :SUSPICIOUS,
              ModerationAPI::Models::ModerateAnalyzeTextResponse::Username::Mode::TaggedSymbol
            )
          PARANOID =
            T.let(
              :PARANOID,
              ModerationAPI::Models::ModerateAnalyzeTextResponse::Username::Mode::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ModerationAPI::Models::ModerateAnalyzeTextResponse::Username::Mode::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class Wordlist < ModerationAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ModerationAPI::Models::ModerateAnalyzeTextResponse::Wordlist,
              ModerationAPI::Internal::AnyHash
            )
          end

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

        # The detection mode.
        sig do
          returns(
            T.nilable(
              ModerationAPI::Models::ModerateAnalyzeTextResponse::Wordlist::Mode::TaggedSymbol
            )
          )
        end
        attr_reader :mode

        sig do
          params(
            mode:
              ModerationAPI::Models::ModerateAnalyzeTextResponse::Wordlist::Mode::OrSymbol
          ).void
        end
        attr_writer :mode

        # Indicates a warning from the model, e.g. if the text is too short or long and
        # the model might not be accurate.
        sig { returns(T.nilable(String)) }
        attr_reader :warning

        sig { params(warning: String).void }
        attr_writer :warning

        # The wordlist entity matcher output if enabled in your project. Read more at
        # https://docs.moderationapi.com/models/word
        sig do
          params(
            components: T.anything,
            error: String,
            found: T::Boolean,
            matches: T::Array[String],
            mode:
              ModerationAPI::Models::ModerateAnalyzeTextResponse::Wordlist::Mode::OrSymbol,
            warning: String
          ).returns(T.attached_class)
        end
        def self.new(
          # The components of the matcher.
          components: nil,
          # Indicates an error with the matcher.
          error: nil,
          # Whether a match was found or not.
          found: nil,
          # The matches of the entity matcher.
          matches: nil,
          # The detection mode.
          mode: nil,
          # Indicates a warning from the model, e.g. if the text is too short or long and
          # the model might not be accurate.
          warning: nil
        )
        end

        sig do
          override.returns(
            {
              components: T.anything,
              error: String,
              found: T::Boolean,
              matches: T::Array[String],
              mode:
                ModerationAPI::Models::ModerateAnalyzeTextResponse::Wordlist::Mode::TaggedSymbol,
              warning: String
            }
          )
        end
        def to_hash
        end

        # The detection mode.
        module Mode
          extend ModerationAPI::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                ModerationAPI::Models::ModerateAnalyzeTextResponse::Wordlist::Mode
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          NORMAL =
            T.let(
              :NORMAL,
              ModerationAPI::Models::ModerateAnalyzeTextResponse::Wordlist::Mode::TaggedSymbol
            )
          SUSPICIOUS =
            T.let(
              :SUSPICIOUS,
              ModerationAPI::Models::ModerateAnalyzeTextResponse::Wordlist::Mode::TaggedSymbol
            )
          PARANOID =
            T.let(
              :PARANOID,
              ModerationAPI::Models::ModerateAnalyzeTextResponse::Wordlist::Mode::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ModerationAPI::Models::ModerateAnalyzeTextResponse::Wordlist::Mode::TaggedSymbol
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
