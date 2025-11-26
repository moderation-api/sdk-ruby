# typed: strong

module ModerationAPI
  module Resources
    class Wordlist
      class Words
        # Add words to an existing wordlist
        sig do
          params(
            id: String,
            words: T::Array[String],
            request_options: ModerationAPI::RequestOptions::OrHash
          ).returns(ModerationAPI::Models::Wordlist::WordAddResponse)
        end
        def add(
          # ID of the wordlist to add words to
          id,
          # Array of words to add to the wordlist. Duplicate words will be ignored.
          words:,
          request_options: {}
        )
        end

        # Remove words from an existing wordlist
        sig do
          params(
            id: String,
            words: T::Array[String],
            request_options: ModerationAPI::RequestOptions::OrHash
          ).returns(ModerationAPI::Models::Wordlist::WordRemoveResponse)
        end
        def remove(
          # ID of the wordlist to remove words from
          id,
          # Array of words to remove from the wordlist
          words:,
          request_options: {}
        )
        end

        # @api private
        sig { params(client: ModerationAPI::Client).returns(T.attached_class) }
        def self.new(client:)
        end
      end
    end
  end
end
