# typed: strong

module ModerationAPI
  module Models
    class ContentSubmitParams < ModerationAPI::Internal::Type::BaseModel
      extend ModerationAPI::Internal::Type::RequestParameters::Converter
      include ModerationAPI::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            ModerationAPI::ContentSubmitParams,
            ModerationAPI::Internal::AnyHash
          )
        end

      # The content sent for moderation
      sig do
        returns(
          T.any(
            ModerationAPI::ContentSubmitParams::Content::Text,
            ModerationAPI::ContentSubmitParams::Content::Image,
            ModerationAPI::ContentSubmitParams::Content::Video,
            ModerationAPI::ContentSubmitParams::Content::Audio,
            ModerationAPI::ContentSubmitParams::Content::Object
          )
        )
      end
      attr_accessor :content

      # The author of the content.
      sig { returns(T.nilable(String)) }
      attr_reader :author_id

      sig { params(author_id: String).void }
      attr_writer :author_id

      # Provide a channel ID or key. Will use the project's default channel if not
      # provided.
      sig { returns(T.nilable(String)) }
      attr_reader :channel

      sig { params(channel: String).void }
      attr_writer :channel

      # The unique ID of the content in your database.
      sig { returns(T.nilable(String)) }
      attr_reader :content_id

      sig { params(content_id: String).void }
      attr_writer :content_id

      # For example the ID of a chat room or a post
      sig { returns(T.nilable(String)) }
      attr_reader :conversation_id

      sig { params(conversation_id: String).void }
      attr_writer :conversation_id

      # Do not store the content. The content won't enter the review queue
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :do_not_store

      sig { params(do_not_store: T::Boolean).void }
      attr_writer :do_not_store

      # Any metadata you want to store with the content
      sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
      attr_reader :metadata

      sig { params(metadata: T::Hash[Symbol, T.anything]).void }
      attr_writer :metadata

      # The meta type of content being moderated
      sig do
        returns(
          T.nilable(ModerationAPI::ContentSubmitParams::MetaType::OrSymbol)
        )
      end
      attr_reader :meta_type

      sig do
        params(
          meta_type: ModerationAPI::ContentSubmitParams::MetaType::OrSymbol
        ).void
      end
      attr_writer :meta_type

      # (Enterprise) override the channel policies for this moderation request only.
      sig do
        returns(
          T.nilable(
            T::Array[
              T.any(
                ModerationAPI::ContentSubmitParams::Policy::Toxicity,
                ModerationAPI::ContentSubmitParams::Policy::PersonalInformation,
                ModerationAPI::ContentSubmitParams::Policy::ToxicitySevere,
                ModerationAPI::ContentSubmitParams::Policy::Hate,
                ModerationAPI::ContentSubmitParams::Policy::Illicit,
                ModerationAPI::ContentSubmitParams::Policy::IllicitDrugs,
                ModerationAPI::ContentSubmitParams::Policy::IllicitAlcohol,
                ModerationAPI::ContentSubmitParams::Policy::IllicitFirearms,
                ModerationAPI::ContentSubmitParams::Policy::IllicitTobacco,
                ModerationAPI::ContentSubmitParams::Policy::IllicitGambling,
                ModerationAPI::ContentSubmitParams::Policy::Cannabis,
                ModerationAPI::ContentSubmitParams::Policy::Sexual,
                ModerationAPI::ContentSubmitParams::Policy::Flirtation,
                ModerationAPI::ContentSubmitParams::Policy::Profanity,
                ModerationAPI::ContentSubmitParams::Policy::Violence,
                ModerationAPI::ContentSubmitParams::Policy::SelfHarm,
                ModerationAPI::ContentSubmitParams::Policy::Spam,
                ModerationAPI::ContentSubmitParams::Policy::SelfPromotion,
                ModerationAPI::ContentSubmitParams::Policy::Political,
                ModerationAPI::ContentSubmitParams::Policy::Religion,
                ModerationAPI::ContentSubmitParams::Policy::CodeAbuse,
                ModerationAPI::ContentSubmitParams::Policy::PiiMasking,
                ModerationAPI::ContentSubmitParams::Policy::URLMasking,
                ModerationAPI::ContentSubmitParams::Policy::Guideline
              )
            ]
          )
        )
      end
      attr_reader :policies

      sig do
        params(
          policies:
            T::Array[
              T.any(
                ModerationAPI::ContentSubmitParams::Policy::Toxicity::OrHash,
                ModerationAPI::ContentSubmitParams::Policy::PersonalInformation::OrHash,
                ModerationAPI::ContentSubmitParams::Policy::ToxicitySevere::OrHash,
                ModerationAPI::ContentSubmitParams::Policy::Hate::OrHash,
                ModerationAPI::ContentSubmitParams::Policy::Illicit::OrHash,
                ModerationAPI::ContentSubmitParams::Policy::IllicitDrugs::OrHash,
                ModerationAPI::ContentSubmitParams::Policy::IllicitAlcohol::OrHash,
                ModerationAPI::ContentSubmitParams::Policy::IllicitFirearms::OrHash,
                ModerationAPI::ContentSubmitParams::Policy::IllicitTobacco::OrHash,
                ModerationAPI::ContentSubmitParams::Policy::IllicitGambling::OrHash,
                ModerationAPI::ContentSubmitParams::Policy::Cannabis::OrHash,
                ModerationAPI::ContentSubmitParams::Policy::Sexual::OrHash,
                ModerationAPI::ContentSubmitParams::Policy::Flirtation::OrHash,
                ModerationAPI::ContentSubmitParams::Policy::Profanity::OrHash,
                ModerationAPI::ContentSubmitParams::Policy::Violence::OrHash,
                ModerationAPI::ContentSubmitParams::Policy::SelfHarm::OrHash,
                ModerationAPI::ContentSubmitParams::Policy::Spam::OrHash,
                ModerationAPI::ContentSubmitParams::Policy::SelfPromotion::OrHash,
                ModerationAPI::ContentSubmitParams::Policy::Political::OrHash,
                ModerationAPI::ContentSubmitParams::Policy::Religion::OrHash,
                ModerationAPI::ContentSubmitParams::Policy::CodeAbuse::OrHash,
                ModerationAPI::ContentSubmitParams::Policy::PiiMasking::OrHash,
                ModerationAPI::ContentSubmitParams::Policy::URLMasking::OrHash,
                ModerationAPI::ContentSubmitParams::Policy::Guideline::OrHash
              )
            ]
        ).void
      end
      attr_writer :policies

      # Unix timestamp (in milliseconds) of when the content was created. Use if content
      # is not submitted in real-time.
      sig { returns(T.nilable(Float)) }
      attr_reader :timestamp

      sig { params(timestamp: Float).void }
      attr_writer :timestamp

      sig do
        params(
          content:
            T.any(
              ModerationAPI::ContentSubmitParams::Content::Text::OrHash,
              ModerationAPI::ContentSubmitParams::Content::Image::OrHash,
              ModerationAPI::ContentSubmitParams::Content::Video::OrHash,
              ModerationAPI::ContentSubmitParams::Content::Audio::OrHash,
              ModerationAPI::ContentSubmitParams::Content::Object::OrHash
            ),
          author_id: String,
          channel: String,
          content_id: String,
          conversation_id: String,
          do_not_store: T::Boolean,
          metadata: T::Hash[Symbol, T.anything],
          meta_type: ModerationAPI::ContentSubmitParams::MetaType::OrSymbol,
          policies:
            T::Array[
              T.any(
                ModerationAPI::ContentSubmitParams::Policy::Toxicity::OrHash,
                ModerationAPI::ContentSubmitParams::Policy::PersonalInformation::OrHash,
                ModerationAPI::ContentSubmitParams::Policy::ToxicitySevere::OrHash,
                ModerationAPI::ContentSubmitParams::Policy::Hate::OrHash,
                ModerationAPI::ContentSubmitParams::Policy::Illicit::OrHash,
                ModerationAPI::ContentSubmitParams::Policy::IllicitDrugs::OrHash,
                ModerationAPI::ContentSubmitParams::Policy::IllicitAlcohol::OrHash,
                ModerationAPI::ContentSubmitParams::Policy::IllicitFirearms::OrHash,
                ModerationAPI::ContentSubmitParams::Policy::IllicitTobacco::OrHash,
                ModerationAPI::ContentSubmitParams::Policy::IllicitGambling::OrHash,
                ModerationAPI::ContentSubmitParams::Policy::Cannabis::OrHash,
                ModerationAPI::ContentSubmitParams::Policy::Sexual::OrHash,
                ModerationAPI::ContentSubmitParams::Policy::Flirtation::OrHash,
                ModerationAPI::ContentSubmitParams::Policy::Profanity::OrHash,
                ModerationAPI::ContentSubmitParams::Policy::Violence::OrHash,
                ModerationAPI::ContentSubmitParams::Policy::SelfHarm::OrHash,
                ModerationAPI::ContentSubmitParams::Policy::Spam::OrHash,
                ModerationAPI::ContentSubmitParams::Policy::SelfPromotion::OrHash,
                ModerationAPI::ContentSubmitParams::Policy::Political::OrHash,
                ModerationAPI::ContentSubmitParams::Policy::Religion::OrHash,
                ModerationAPI::ContentSubmitParams::Policy::CodeAbuse::OrHash,
                ModerationAPI::ContentSubmitParams::Policy::PiiMasking::OrHash,
                ModerationAPI::ContentSubmitParams::Policy::URLMasking::OrHash,
                ModerationAPI::ContentSubmitParams::Policy::Guideline::OrHash
              )
            ],
          timestamp: Float,
          request_options: ModerationAPI::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The content sent for moderation
        content:,
        # The author of the content.
        author_id: nil,
        # Provide a channel ID or key. Will use the project's default channel if not
        # provided.
        channel: nil,
        # The unique ID of the content in your database.
        content_id: nil,
        # For example the ID of a chat room or a post
        conversation_id: nil,
        # Do not store the content. The content won't enter the review queue
        do_not_store: nil,
        # Any metadata you want to store with the content
        metadata: nil,
        # The meta type of content being moderated
        meta_type: nil,
        # (Enterprise) override the channel policies for this moderation request only.
        policies: nil,
        # Unix timestamp (in milliseconds) of when the content was created. Use if content
        # is not submitted in real-time.
        timestamp: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            content:
              T.any(
                ModerationAPI::ContentSubmitParams::Content::Text,
                ModerationAPI::ContentSubmitParams::Content::Image,
                ModerationAPI::ContentSubmitParams::Content::Video,
                ModerationAPI::ContentSubmitParams::Content::Audio,
                ModerationAPI::ContentSubmitParams::Content::Object
              ),
            author_id: String,
            channel: String,
            content_id: String,
            conversation_id: String,
            do_not_store: T::Boolean,
            metadata: T::Hash[Symbol, T.anything],
            meta_type: ModerationAPI::ContentSubmitParams::MetaType::OrSymbol,
            policies:
              T::Array[
                T.any(
                  ModerationAPI::ContentSubmitParams::Policy::Toxicity,
                  ModerationAPI::ContentSubmitParams::Policy::PersonalInformation,
                  ModerationAPI::ContentSubmitParams::Policy::ToxicitySevere,
                  ModerationAPI::ContentSubmitParams::Policy::Hate,
                  ModerationAPI::ContentSubmitParams::Policy::Illicit,
                  ModerationAPI::ContentSubmitParams::Policy::IllicitDrugs,
                  ModerationAPI::ContentSubmitParams::Policy::IllicitAlcohol,
                  ModerationAPI::ContentSubmitParams::Policy::IllicitFirearms,
                  ModerationAPI::ContentSubmitParams::Policy::IllicitTobacco,
                  ModerationAPI::ContentSubmitParams::Policy::IllicitGambling,
                  ModerationAPI::ContentSubmitParams::Policy::Cannabis,
                  ModerationAPI::ContentSubmitParams::Policy::Sexual,
                  ModerationAPI::ContentSubmitParams::Policy::Flirtation,
                  ModerationAPI::ContentSubmitParams::Policy::Profanity,
                  ModerationAPI::ContentSubmitParams::Policy::Violence,
                  ModerationAPI::ContentSubmitParams::Policy::SelfHarm,
                  ModerationAPI::ContentSubmitParams::Policy::Spam,
                  ModerationAPI::ContentSubmitParams::Policy::SelfPromotion,
                  ModerationAPI::ContentSubmitParams::Policy::Political,
                  ModerationAPI::ContentSubmitParams::Policy::Religion,
                  ModerationAPI::ContentSubmitParams::Policy::CodeAbuse,
                  ModerationAPI::ContentSubmitParams::Policy::PiiMasking,
                  ModerationAPI::ContentSubmitParams::Policy::URLMasking,
                  ModerationAPI::ContentSubmitParams::Policy::Guideline
                )
              ],
            timestamp: Float,
            request_options: ModerationAPI::RequestOptions
          }
        )
      end
      def to_hash
      end

      # The content sent for moderation
      module Content
        extend ModerationAPI::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              ModerationAPI::ContentSubmitParams::Content::Text,
              ModerationAPI::ContentSubmitParams::Content::Image,
              ModerationAPI::ContentSubmitParams::Content::Video,
              ModerationAPI::ContentSubmitParams::Content::Audio,
              ModerationAPI::ContentSubmitParams::Content::Object
            )
          end

        class Text < ModerationAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ModerationAPI::ContentSubmitParams::Content::Text,
                ModerationAPI::Internal::AnyHash
              )
            end

          # The content text
          sig { returns(String) }
          attr_accessor :text

          sig { returns(Symbol) }
          attr_accessor :type

          # Text
          sig { params(text: String, type: Symbol).returns(T.attached_class) }
          def self.new(
            # The content text
            text:,
            type: :text
          )
          end

          sig { override.returns({ text: String, type: Symbol }) }
          def to_hash
          end
        end

        class Image < ModerationAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ModerationAPI::ContentSubmitParams::Content::Image,
                ModerationAPI::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :type

          # A public URL of the image content
          sig { returns(String) }
          attr_accessor :url

          # Image
          sig { params(url: String, type: Symbol).returns(T.attached_class) }
          def self.new(
            # A public URL of the image content
            url:,
            type: :image
          )
          end

          sig { override.returns({ type: Symbol, url: String }) }
          def to_hash
          end
        end

        class Video < ModerationAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ModerationAPI::ContentSubmitParams::Content::Video,
                ModerationAPI::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :type

          # A public URL of the video content
          sig { returns(String) }
          attr_accessor :url

          # Video
          sig { params(url: String, type: Symbol).returns(T.attached_class) }
          def self.new(
            # A public URL of the video content
            url:,
            type: :video
          )
          end

          sig { override.returns({ type: Symbol, url: String }) }
          def to_hash
          end
        end

        class Audio < ModerationAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ModerationAPI::ContentSubmitParams::Content::Audio,
                ModerationAPI::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :type

          # The URL of the audio content
          sig { returns(String) }
          attr_accessor :url

          # Audio
          sig { params(url: String, type: Symbol).returns(T.attached_class) }
          def self.new(
            # The URL of the audio content
            url:,
            type: :audio
          )
          end

          sig { override.returns({ type: Symbol, url: String }) }
          def to_hash
          end
        end

        class Object < ModerationAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ModerationAPI::ContentSubmitParams::Content::Object,
                ModerationAPI::Internal::AnyHash
              )
            end

          # Values in the object. Can be mixed content types.
          sig do
            returns(
              T::Hash[
                Symbol,
                T.any(
                  ModerationAPI::ContentSubmitParams::Content::Object::Data::Text,
                  ModerationAPI::ContentSubmitParams::Content::Object::Data::Image,
                  ModerationAPI::ContentSubmitParams::Content::Object::Data::Video,
                  ModerationAPI::ContentSubmitParams::Content::Object::Data::Audio
                )
              ]
            )
          end
          attr_accessor :data

          sig { returns(Symbol) }
          attr_accessor :type

          # Object
          sig do
            params(
              data:
                T::Hash[
                  Symbol,
                  T.any(
                    ModerationAPI::ContentSubmitParams::Content::Object::Data::Text::OrHash,
                    ModerationAPI::ContentSubmitParams::Content::Object::Data::Image::OrHash,
                    ModerationAPI::ContentSubmitParams::Content::Object::Data::Video::OrHash,
                    ModerationAPI::ContentSubmitParams::Content::Object::Data::Audio::OrHash
                  )
                ],
              type: Symbol
            ).returns(T.attached_class)
          end
          def self.new(
            # Values in the object. Can be mixed content types.
            data:,
            type: :object
          )
          end

          sig do
            override.returns(
              {
                data:
                  T::Hash[
                    Symbol,
                    T.any(
                      ModerationAPI::ContentSubmitParams::Content::Object::Data::Text,
                      ModerationAPI::ContentSubmitParams::Content::Object::Data::Image,
                      ModerationAPI::ContentSubmitParams::Content::Object::Data::Video,
                      ModerationAPI::ContentSubmitParams::Content::Object::Data::Audio
                    )
                  ],
                type: Symbol
              }
            )
          end
          def to_hash
          end

          # Text
          module Data
            extend ModerationAPI::Internal::Type::Union

            Variants =
              T.type_alias do
                T.any(
                  ModerationAPI::ContentSubmitParams::Content::Object::Data::Text,
                  ModerationAPI::ContentSubmitParams::Content::Object::Data::Image,
                  ModerationAPI::ContentSubmitParams::Content::Object::Data::Video,
                  ModerationAPI::ContentSubmitParams::Content::Object::Data::Audio
                )
              end

            class Text < ModerationAPI::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    ModerationAPI::ContentSubmitParams::Content::Object::Data::Text,
                    ModerationAPI::Internal::AnyHash
                  )
                end

              # The content text
              sig { returns(String) }
              attr_accessor :text

              sig { returns(Symbol) }
              attr_accessor :type

              # Text
              sig do
                params(text: String, type: Symbol).returns(T.attached_class)
              end
              def self.new(
                # The content text
                text:,
                type: :text
              )
              end

              sig { override.returns({ text: String, type: Symbol }) }
              def to_hash
              end
            end

            class Image < ModerationAPI::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    ModerationAPI::ContentSubmitParams::Content::Object::Data::Image,
                    ModerationAPI::Internal::AnyHash
                  )
                end

              sig { returns(Symbol) }
              attr_accessor :type

              # A public URL of the image content
              sig { returns(String) }
              attr_accessor :url

              # Image
              sig do
                params(url: String, type: Symbol).returns(T.attached_class)
              end
              def self.new(
                # A public URL of the image content
                url:,
                type: :image
              )
              end

              sig { override.returns({ type: Symbol, url: String }) }
              def to_hash
              end
            end

            class Video < ModerationAPI::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    ModerationAPI::ContentSubmitParams::Content::Object::Data::Video,
                    ModerationAPI::Internal::AnyHash
                  )
                end

              sig { returns(Symbol) }
              attr_accessor :type

              # A public URL of the video content
              sig { returns(String) }
              attr_accessor :url

              # Video
              sig do
                params(url: String, type: Symbol).returns(T.attached_class)
              end
              def self.new(
                # A public URL of the video content
                url:,
                type: :video
              )
              end

              sig { override.returns({ type: Symbol, url: String }) }
              def to_hash
              end
            end

            class Audio < ModerationAPI::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    ModerationAPI::ContentSubmitParams::Content::Object::Data::Audio,
                    ModerationAPI::Internal::AnyHash
                  )
                end

              sig { returns(Symbol) }
              attr_accessor :type

              # The URL of the audio content
              sig { returns(String) }
              attr_accessor :url

              # Audio
              sig do
                params(url: String, type: Symbol).returns(T.attached_class)
              end
              def self.new(
                # The URL of the audio content
                url:,
                type: :audio
              )
              end

              sig { override.returns({ type: Symbol, url: String }) }
              def to_hash
              end
            end

            sig do
              override.returns(
                T::Array[
                  ModerationAPI::ContentSubmitParams::Content::Object::Data::Variants
                ]
              )
            end
            def self.variants
            end
          end
        end

        sig do
          override.returns(
            T::Array[ModerationAPI::ContentSubmitParams::Content::Variants]
          )
        end
        def self.variants
        end
      end

      # The meta type of content being moderated
      module MetaType
        extend ModerationAPI::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, ModerationAPI::ContentSubmitParams::MetaType)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        PROFILE =
          T.let(
            :profile,
            ModerationAPI::ContentSubmitParams::MetaType::TaggedSymbol
          )
        MESSAGE =
          T.let(
            :message,
            ModerationAPI::ContentSubmitParams::MetaType::TaggedSymbol
          )
        POST =
          T.let(
            :post,
            ModerationAPI::ContentSubmitParams::MetaType::TaggedSymbol
          )
        COMMENT =
          T.let(
            :comment,
            ModerationAPI::ContentSubmitParams::MetaType::TaggedSymbol
          )
        EVENT =
          T.let(
            :event,
            ModerationAPI::ContentSubmitParams::MetaType::TaggedSymbol
          )
        PRODUCT =
          T.let(
            :product,
            ModerationAPI::ContentSubmitParams::MetaType::TaggedSymbol
          )
        REVIEW =
          T.let(
            :review,
            ModerationAPI::ContentSubmitParams::MetaType::TaggedSymbol
          )
        OTHER =
          T.let(
            :other,
            ModerationAPI::ContentSubmitParams::MetaType::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[ModerationAPI::ContentSubmitParams::MetaType::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      module Policy
        extend ModerationAPI::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              ModerationAPI::ContentSubmitParams::Policy::Toxicity,
              ModerationAPI::ContentSubmitParams::Policy::PersonalInformation,
              ModerationAPI::ContentSubmitParams::Policy::ToxicitySevere,
              ModerationAPI::ContentSubmitParams::Policy::Hate,
              ModerationAPI::ContentSubmitParams::Policy::Illicit,
              ModerationAPI::ContentSubmitParams::Policy::IllicitDrugs,
              ModerationAPI::ContentSubmitParams::Policy::IllicitAlcohol,
              ModerationAPI::ContentSubmitParams::Policy::IllicitFirearms,
              ModerationAPI::ContentSubmitParams::Policy::IllicitTobacco,
              ModerationAPI::ContentSubmitParams::Policy::IllicitGambling,
              ModerationAPI::ContentSubmitParams::Policy::Cannabis,
              ModerationAPI::ContentSubmitParams::Policy::Sexual,
              ModerationAPI::ContentSubmitParams::Policy::Flirtation,
              ModerationAPI::ContentSubmitParams::Policy::Profanity,
              ModerationAPI::ContentSubmitParams::Policy::Violence,
              ModerationAPI::ContentSubmitParams::Policy::SelfHarm,
              ModerationAPI::ContentSubmitParams::Policy::Spam,
              ModerationAPI::ContentSubmitParams::Policy::SelfPromotion,
              ModerationAPI::ContentSubmitParams::Policy::Political,
              ModerationAPI::ContentSubmitParams::Policy::Religion,
              ModerationAPI::ContentSubmitParams::Policy::CodeAbuse,
              ModerationAPI::ContentSubmitParams::Policy::PiiMasking,
              ModerationAPI::ContentSubmitParams::Policy::URLMasking,
              ModerationAPI::ContentSubmitParams::Policy::Guideline
            )
          end

        class Toxicity < ModerationAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ModerationAPI::ContentSubmitParams::Policy::Toxicity,
                ModerationAPI::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :id

          sig { returns(T::Boolean) }
          attr_accessor :flag

          sig { returns(T.nilable(Float)) }
          attr_reader :threshold

          sig { params(threshold: Float).void }
          attr_writer :threshold

          sig do
            params(flag: T::Boolean, threshold: Float, id: Symbol).returns(
              T.attached_class
            )
          end
          def self.new(flag:, threshold: nil, id: :toxicity)
          end

          sig do
            override.returns({ id: Symbol, flag: T::Boolean, threshold: Float })
          end
          def to_hash
          end
        end

        class PersonalInformation < ModerationAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ModerationAPI::ContentSubmitParams::Policy::PersonalInformation,
                ModerationAPI::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :id

          sig { returns(T::Boolean) }
          attr_accessor :flag

          sig { returns(T.nilable(Float)) }
          attr_reader :threshold

          sig { params(threshold: Float).void }
          attr_writer :threshold

          sig do
            params(flag: T::Boolean, threshold: Float, id: Symbol).returns(
              T.attached_class
            )
          end
          def self.new(flag:, threshold: nil, id: :personal_information)
          end

          sig do
            override.returns({ id: Symbol, flag: T::Boolean, threshold: Float })
          end
          def to_hash
          end
        end

        class ToxicitySevere < ModerationAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ModerationAPI::ContentSubmitParams::Policy::ToxicitySevere,
                ModerationAPI::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :id

          sig { returns(T::Boolean) }
          attr_accessor :flag

          sig { returns(T.nilable(Float)) }
          attr_reader :threshold

          sig { params(threshold: Float).void }
          attr_writer :threshold

          sig do
            params(flag: T::Boolean, threshold: Float, id: Symbol).returns(
              T.attached_class
            )
          end
          def self.new(flag:, threshold: nil, id: :toxicity_severe)
          end

          sig do
            override.returns({ id: Symbol, flag: T::Boolean, threshold: Float })
          end
          def to_hash
          end
        end

        class Hate < ModerationAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ModerationAPI::ContentSubmitParams::Policy::Hate,
                ModerationAPI::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :id

          sig { returns(T::Boolean) }
          attr_accessor :flag

          sig { returns(T.nilable(Float)) }
          attr_reader :threshold

          sig { params(threshold: Float).void }
          attr_writer :threshold

          sig do
            params(flag: T::Boolean, threshold: Float, id: Symbol).returns(
              T.attached_class
            )
          end
          def self.new(flag:, threshold: nil, id: :hate)
          end

          sig do
            override.returns({ id: Symbol, flag: T::Boolean, threshold: Float })
          end
          def to_hash
          end
        end

        class Illicit < ModerationAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ModerationAPI::ContentSubmitParams::Policy::Illicit,
                ModerationAPI::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :id

          sig { returns(T::Boolean) }
          attr_accessor :flag

          sig { returns(T.nilable(Float)) }
          attr_reader :threshold

          sig { params(threshold: Float).void }
          attr_writer :threshold

          sig do
            params(flag: T::Boolean, threshold: Float, id: Symbol).returns(
              T.attached_class
            )
          end
          def self.new(flag:, threshold: nil, id: :illicit)
          end

          sig do
            override.returns({ id: Symbol, flag: T::Boolean, threshold: Float })
          end
          def to_hash
          end
        end

        class IllicitDrugs < ModerationAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ModerationAPI::ContentSubmitParams::Policy::IllicitDrugs,
                ModerationAPI::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :id

          sig { returns(T::Boolean) }
          attr_accessor :flag

          sig { returns(T.nilable(Float)) }
          attr_reader :threshold

          sig { params(threshold: Float).void }
          attr_writer :threshold

          sig do
            params(flag: T::Boolean, threshold: Float, id: Symbol).returns(
              T.attached_class
            )
          end
          def self.new(flag:, threshold: nil, id: :illicit_drugs)
          end

          sig do
            override.returns({ id: Symbol, flag: T::Boolean, threshold: Float })
          end
          def to_hash
          end
        end

        class IllicitAlcohol < ModerationAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ModerationAPI::ContentSubmitParams::Policy::IllicitAlcohol,
                ModerationAPI::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :id

          sig { returns(T::Boolean) }
          attr_accessor :flag

          sig { returns(T.nilable(Float)) }
          attr_reader :threshold

          sig { params(threshold: Float).void }
          attr_writer :threshold

          sig do
            params(flag: T::Boolean, threshold: Float, id: Symbol).returns(
              T.attached_class
            )
          end
          def self.new(flag:, threshold: nil, id: :illicit_alcohol)
          end

          sig do
            override.returns({ id: Symbol, flag: T::Boolean, threshold: Float })
          end
          def to_hash
          end
        end

        class IllicitFirearms < ModerationAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ModerationAPI::ContentSubmitParams::Policy::IllicitFirearms,
                ModerationAPI::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :id

          sig { returns(T::Boolean) }
          attr_accessor :flag

          sig { returns(T.nilable(Float)) }
          attr_reader :threshold

          sig { params(threshold: Float).void }
          attr_writer :threshold

          sig do
            params(flag: T::Boolean, threshold: Float, id: Symbol).returns(
              T.attached_class
            )
          end
          def self.new(flag:, threshold: nil, id: :illicit_firearms)
          end

          sig do
            override.returns({ id: Symbol, flag: T::Boolean, threshold: Float })
          end
          def to_hash
          end
        end

        class IllicitTobacco < ModerationAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ModerationAPI::ContentSubmitParams::Policy::IllicitTobacco,
                ModerationAPI::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :id

          sig { returns(T::Boolean) }
          attr_accessor :flag

          sig { returns(T.nilable(Float)) }
          attr_reader :threshold

          sig { params(threshold: Float).void }
          attr_writer :threshold

          sig do
            params(flag: T::Boolean, threshold: Float, id: Symbol).returns(
              T.attached_class
            )
          end
          def self.new(flag:, threshold: nil, id: :illicit_tobacco)
          end

          sig do
            override.returns({ id: Symbol, flag: T::Boolean, threshold: Float })
          end
          def to_hash
          end
        end

        class IllicitGambling < ModerationAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ModerationAPI::ContentSubmitParams::Policy::IllicitGambling,
                ModerationAPI::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :id

          sig { returns(T::Boolean) }
          attr_accessor :flag

          sig { returns(T.nilable(Float)) }
          attr_reader :threshold

          sig { params(threshold: Float).void }
          attr_writer :threshold

          sig do
            params(flag: T::Boolean, threshold: Float, id: Symbol).returns(
              T.attached_class
            )
          end
          def self.new(flag:, threshold: nil, id: :illicit_gambling)
          end

          sig do
            override.returns({ id: Symbol, flag: T::Boolean, threshold: Float })
          end
          def to_hash
          end
        end

        class Cannabis < ModerationAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ModerationAPI::ContentSubmitParams::Policy::Cannabis,
                ModerationAPI::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :id

          sig { returns(T::Boolean) }
          attr_accessor :flag

          sig { returns(T.nilable(Float)) }
          attr_reader :threshold

          sig { params(threshold: Float).void }
          attr_writer :threshold

          sig do
            params(flag: T::Boolean, threshold: Float, id: Symbol).returns(
              T.attached_class
            )
          end
          def self.new(flag:, threshold: nil, id: :cannabis)
          end

          sig do
            override.returns({ id: Symbol, flag: T::Boolean, threshold: Float })
          end
          def to_hash
          end
        end

        class Sexual < ModerationAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ModerationAPI::ContentSubmitParams::Policy::Sexual,
                ModerationAPI::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :id

          sig { returns(T::Boolean) }
          attr_accessor :flag

          sig { returns(T.nilable(Float)) }
          attr_reader :threshold

          sig { params(threshold: Float).void }
          attr_writer :threshold

          sig do
            params(flag: T::Boolean, threshold: Float, id: Symbol).returns(
              T.attached_class
            )
          end
          def self.new(flag:, threshold: nil, id: :sexual)
          end

          sig do
            override.returns({ id: Symbol, flag: T::Boolean, threshold: Float })
          end
          def to_hash
          end
        end

        class Flirtation < ModerationAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ModerationAPI::ContentSubmitParams::Policy::Flirtation,
                ModerationAPI::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :id

          sig { returns(T::Boolean) }
          attr_accessor :flag

          sig { returns(T.nilable(Float)) }
          attr_reader :threshold

          sig { params(threshold: Float).void }
          attr_writer :threshold

          sig do
            params(flag: T::Boolean, threshold: Float, id: Symbol).returns(
              T.attached_class
            )
          end
          def self.new(flag:, threshold: nil, id: :flirtation)
          end

          sig do
            override.returns({ id: Symbol, flag: T::Boolean, threshold: Float })
          end
          def to_hash
          end
        end

        class Profanity < ModerationAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ModerationAPI::ContentSubmitParams::Policy::Profanity,
                ModerationAPI::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :id

          sig { returns(T::Boolean) }
          attr_accessor :flag

          sig { returns(T.nilable(Float)) }
          attr_reader :threshold

          sig { params(threshold: Float).void }
          attr_writer :threshold

          sig do
            params(flag: T::Boolean, threshold: Float, id: Symbol).returns(
              T.attached_class
            )
          end
          def self.new(flag:, threshold: nil, id: :profanity)
          end

          sig do
            override.returns({ id: Symbol, flag: T::Boolean, threshold: Float })
          end
          def to_hash
          end
        end

        class Violence < ModerationAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ModerationAPI::ContentSubmitParams::Policy::Violence,
                ModerationAPI::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :id

          sig { returns(T::Boolean) }
          attr_accessor :flag

          sig { returns(T.nilable(Float)) }
          attr_reader :threshold

          sig { params(threshold: Float).void }
          attr_writer :threshold

          sig do
            params(flag: T::Boolean, threshold: Float, id: Symbol).returns(
              T.attached_class
            )
          end
          def self.new(flag:, threshold: nil, id: :violence)
          end

          sig do
            override.returns({ id: Symbol, flag: T::Boolean, threshold: Float })
          end
          def to_hash
          end
        end

        class SelfHarm < ModerationAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ModerationAPI::ContentSubmitParams::Policy::SelfHarm,
                ModerationAPI::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :id

          sig { returns(T::Boolean) }
          attr_accessor :flag

          sig { returns(T.nilable(Float)) }
          attr_reader :threshold

          sig { params(threshold: Float).void }
          attr_writer :threshold

          sig do
            params(flag: T::Boolean, threshold: Float, id: Symbol).returns(
              T.attached_class
            )
          end
          def self.new(flag:, threshold: nil, id: :self_harm)
          end

          sig do
            override.returns({ id: Symbol, flag: T::Boolean, threshold: Float })
          end
          def to_hash
          end
        end

        class Spam < ModerationAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ModerationAPI::ContentSubmitParams::Policy::Spam,
                ModerationAPI::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :id

          sig { returns(T::Boolean) }
          attr_accessor :flag

          sig { returns(T.nilable(Float)) }
          attr_reader :threshold

          sig { params(threshold: Float).void }
          attr_writer :threshold

          sig do
            params(flag: T::Boolean, threshold: Float, id: Symbol).returns(
              T.attached_class
            )
          end
          def self.new(flag:, threshold: nil, id: :spam)
          end

          sig do
            override.returns({ id: Symbol, flag: T::Boolean, threshold: Float })
          end
          def to_hash
          end
        end

        class SelfPromotion < ModerationAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ModerationAPI::ContentSubmitParams::Policy::SelfPromotion,
                ModerationAPI::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :id

          sig { returns(T::Boolean) }
          attr_accessor :flag

          sig { returns(T.nilable(Float)) }
          attr_reader :threshold

          sig { params(threshold: Float).void }
          attr_writer :threshold

          sig do
            params(flag: T::Boolean, threshold: Float, id: Symbol).returns(
              T.attached_class
            )
          end
          def self.new(flag:, threshold: nil, id: :self_promotion)
          end

          sig do
            override.returns({ id: Symbol, flag: T::Boolean, threshold: Float })
          end
          def to_hash
          end
        end

        class Political < ModerationAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ModerationAPI::ContentSubmitParams::Policy::Political,
                ModerationAPI::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :id

          sig { returns(T::Boolean) }
          attr_accessor :flag

          sig { returns(T.nilable(Float)) }
          attr_reader :threshold

          sig { params(threshold: Float).void }
          attr_writer :threshold

          sig do
            params(flag: T::Boolean, threshold: Float, id: Symbol).returns(
              T.attached_class
            )
          end
          def self.new(flag:, threshold: nil, id: :political)
          end

          sig do
            override.returns({ id: Symbol, flag: T::Boolean, threshold: Float })
          end
          def to_hash
          end
        end

        class Religion < ModerationAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ModerationAPI::ContentSubmitParams::Policy::Religion,
                ModerationAPI::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :id

          sig { returns(T::Boolean) }
          attr_accessor :flag

          sig { returns(T.nilable(Float)) }
          attr_reader :threshold

          sig { params(threshold: Float).void }
          attr_writer :threshold

          sig do
            params(flag: T::Boolean, threshold: Float, id: Symbol).returns(
              T.attached_class
            )
          end
          def self.new(flag:, threshold: nil, id: :religion)
          end

          sig do
            override.returns({ id: Symbol, flag: T::Boolean, threshold: Float })
          end
          def to_hash
          end
        end

        class CodeAbuse < ModerationAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ModerationAPI::ContentSubmitParams::Policy::CodeAbuse,
                ModerationAPI::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :id

          sig { returns(T::Boolean) }
          attr_accessor :flag

          sig { returns(T.nilable(Float)) }
          attr_reader :threshold

          sig { params(threshold: Float).void }
          attr_writer :threshold

          sig do
            params(flag: T::Boolean, threshold: Float, id: Symbol).returns(
              T.attached_class
            )
          end
          def self.new(flag:, threshold: nil, id: :code_abuse)
          end

          sig do
            override.returns({ id: Symbol, flag: T::Boolean, threshold: Float })
          end
          def to_hash
          end
        end

        class PiiMasking < ModerationAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ModerationAPI::ContentSubmitParams::Policy::PiiMasking,
                ModerationAPI::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :id

          sig do
            returns(
              T::Hash[
                Symbol,
                ModerationAPI::ContentSubmitParams::Policy::PiiMasking::Entity
              ]
            )
          end
          attr_accessor :entities

          sig do
            params(
              entities:
                T::Hash[
                  Symbol,
                  ModerationAPI::ContentSubmitParams::Policy::PiiMasking::Entity::OrHash
                ],
              id: Symbol
            ).returns(T.attached_class)
          end
          def self.new(entities:, id: :pii)
          end

          sig do
            override.returns(
              {
                id: Symbol,
                entities:
                  T::Hash[
                    Symbol,
                    ModerationAPI::ContentSubmitParams::Policy::PiiMasking::Entity
                  ]
              }
            )
          end
          def to_hash
          end

          class Entity < ModerationAPI::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  ModerationAPI::ContentSubmitParams::Policy::PiiMasking::Entity,
                  ModerationAPI::Internal::AnyHash
                )
              end

            sig { returns(T.nilable(T::Boolean)) }
            attr_reader :enable

            sig { params(enable: T::Boolean).void }
            attr_writer :enable

            sig { returns(T.nilable(T::Boolean)) }
            attr_reader :flag

            sig { params(flag: T::Boolean).void }
            attr_writer :flag

            sig { returns(T.nilable(String)) }
            attr_reader :mask

            sig { params(mask: String).void }
            attr_writer :mask

            sig { returns(T.nilable(T::Boolean)) }
            attr_reader :should_mask

            sig { params(should_mask: T::Boolean).void }
            attr_writer :should_mask

            sig do
              params(
                enable: T::Boolean,
                flag: T::Boolean,
                mask: String,
                should_mask: T::Boolean
              ).returns(T.attached_class)
            end
            def self.new(enable: nil, flag: nil, mask: nil, should_mask: nil)
            end

            sig do
              override.returns(
                {
                  enable: T::Boolean,
                  flag: T::Boolean,
                  mask: String,
                  should_mask: T::Boolean
                }
              )
            end
            def to_hash
            end
          end
        end

        class URLMasking < ModerationAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ModerationAPI::ContentSubmitParams::Policy::URLMasking,
                ModerationAPI::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :id

          sig do
            returns(
              T::Hash[
                Symbol,
                ModerationAPI::ContentSubmitParams::Policy::URLMasking::Entity
              ]
            )
          end
          attr_accessor :entities

          sig do
            params(
              entities:
                T::Hash[
                  Symbol,
                  ModerationAPI::ContentSubmitParams::Policy::URLMasking::Entity::OrHash
                ],
              id: Symbol
            ).returns(T.attached_class)
          end
          def self.new(entities:, id: :url)
          end

          sig do
            override.returns(
              {
                id: Symbol,
                entities:
                  T::Hash[
                    Symbol,
                    ModerationAPI::ContentSubmitParams::Policy::URLMasking::Entity
                  ]
              }
            )
          end
          def to_hash
          end

          class Entity < ModerationAPI::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  ModerationAPI::ContentSubmitParams::Policy::URLMasking::Entity,
                  ModerationAPI::Internal::AnyHash
                )
              end

            sig { returns(T.nilable(T::Boolean)) }
            attr_reader :enable

            sig { params(enable: T::Boolean).void }
            attr_writer :enable

            sig { returns(T.nilable(T::Boolean)) }
            attr_reader :flag

            sig { params(flag: T::Boolean).void }
            attr_writer :flag

            sig { returns(T.nilable(String)) }
            attr_reader :mask

            sig { params(mask: String).void }
            attr_writer :mask

            sig { returns(T.nilable(T::Boolean)) }
            attr_reader :should_mask

            sig { params(should_mask: T::Boolean).void }
            attr_writer :should_mask

            sig do
              params(
                enable: T::Boolean,
                flag: T::Boolean,
                mask: String,
                should_mask: T::Boolean
              ).returns(T.attached_class)
            end
            def self.new(enable: nil, flag: nil, mask: nil, should_mask: nil)
            end

            sig do
              override.returns(
                {
                  enable: T::Boolean,
                  flag: T::Boolean,
                  mask: String,
                  should_mask: T::Boolean
                }
              )
            end
            def to_hash
            end
          end
        end

        class Guideline < ModerationAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ModerationAPI::ContentSubmitParams::Policy::Guideline,
                ModerationAPI::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :id

          sig { returns(T::Boolean) }
          attr_accessor :flag

          sig { returns(String) }
          attr_accessor :guideline_key

          sig { returns(String) }
          attr_accessor :instructions

          sig { returns(T.nilable(Float)) }
          attr_reader :threshold

          sig { params(threshold: Float).void }
          attr_writer :threshold

          sig do
            params(
              flag: T::Boolean,
              guideline_key: String,
              instructions: String,
              threshold: Float,
              id: Symbol
            ).returns(T.attached_class)
          end
          def self.new(
            flag:,
            guideline_key:,
            instructions:,
            threshold: nil,
            id: :guideline
          )
          end

          sig do
            override.returns(
              {
                id: Symbol,
                flag: T::Boolean,
                guideline_key: String,
                instructions: String,
                threshold: Float
              }
            )
          end
          def to_hash
          end
        end

        sig do
          override.returns(
            T::Array[ModerationAPI::ContentSubmitParams::Policy::Variants]
          )
        end
        def self.variants
        end
      end
    end
  end
end
