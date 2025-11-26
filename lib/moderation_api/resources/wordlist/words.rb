# frozen_string_literal: true

module ModerationAPI
  module Resources
    class Wordlist
      class Words
        # Add words to an existing wordlist
        #
        # @overload add(id, words:, request_options: {})
        #
        # @param id [String] ID of the wordlist to add words to
        #
        # @param words [Array<String>] Array of words to add to the wordlist. Duplicate words will be ignored.
        #
        # @param request_options [ModerationAPI::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [ModerationAPI::Models::Wordlist::WordAddResponse]
        #
        # @see ModerationAPI::Models::Wordlist::WordAddParams
        def add(id, params)
          parsed, options = ModerationAPI::Wordlist::WordAddParams.dump_request(params)
          @client.request(
            method: :post,
            path: ["wordlist/%1$s/words", id],
            body: parsed,
            model: ModerationAPI::Models::Wordlist::WordAddResponse,
            options: options
          )
        end

        # Remove words from an existing wordlist
        #
        # @overload remove(id, words:, request_options: {})
        #
        # @param id [String] ID of the wordlist to remove words from
        #
        # @param words [Array<String>] Array of words to remove from the wordlist
        #
        # @param request_options [ModerationAPI::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [ModerationAPI::Models::Wordlist::WordRemoveResponse]
        #
        # @see ModerationAPI::Models::Wordlist::WordRemoveParams
        def remove(id, params)
          parsed, options = ModerationAPI::Wordlist::WordRemoveParams.dump_request(params)
          @client.request(
            method: :delete,
            path: ["wordlist/%1$s/words", id],
            query: parsed,
            model: ModerationAPI::Models::Wordlist::WordRemoveResponse,
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
end
