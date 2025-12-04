# frozen_string_literal: true

module ModerationAPI
  class Client < ModerationAPI::Internal::Transport::BaseClient
    # Default max number of retries to attempt after a failed retryable request.
    DEFAULT_MAX_RETRIES = 2

    # Default per-request timeout.
    DEFAULT_TIMEOUT_IN_SECONDS = 60.0

    # Default initial retry delay in seconds.
    # Overall delay is calculated using exponential backoff + jitter.
    DEFAULT_INITIAL_RETRY_DELAY = 0.5

    # Default max retry delay in seconds.
    DEFAULT_MAX_RETRY_DELAY = 8.0

    # @return [String]
    attr_reader :secret_key

    # @return [ModerationAPI::Resources::Authors]
    attr_reader :authors

    # @return [ModerationAPI::Resources::Queue]
    attr_reader :queue

    # @return [ModerationAPI::Resources::Actions]
    attr_reader :actions

    # @return [ModerationAPI::Resources::Content]
    attr_reader :content

    # @return [ModerationAPI::Resources::Account]
    attr_reader :account

    # @return [ModerationAPI::Resources::Auth]
    attr_reader :auth

    # @return [ModerationAPI::Resources::Wordlist]
    attr_reader :wordlist

    # @api private
    #
    # @return [Hash{String=>String}]
    private def auth_headers
      return {} if @secret_key.nil?

      {"authorization" => "Bearer #{@secret_key}"}
    end

    # Creates and returns a new client for interacting with the API.
    #
    # @param secret_key [String, nil] Defaults to `ENV["MODAPI_SECRET_KEY"]`
    #
    # @param base_url [String, nil] Override the default base URL for the API, e.g.,
    # `"https://api.example.com/v2/"`. Defaults to `ENV["MODERATION_API_BASE_URL"]`
    #
    # @param max_retries [Integer] Max number of retries to attempt after a failed retryable request.
    #
    # @param timeout [Float]
    #
    # @param initial_retry_delay [Float]
    #
    # @param max_retry_delay [Float]
    def initialize(
      secret_key: ENV["MODAPI_SECRET_KEY"],
      base_url: ENV["MODERATION_API_BASE_URL"],
      max_retries: self.class::DEFAULT_MAX_RETRIES,
      timeout: self.class::DEFAULT_TIMEOUT_IN_SECONDS,
      initial_retry_delay: self.class::DEFAULT_INITIAL_RETRY_DELAY,
      max_retry_delay: self.class::DEFAULT_MAX_RETRY_DELAY
    )
      base_url ||= "https://api.moderationapi.com/v1"

      if secret_key.nil?
        raise ArgumentError.new("secret_key is required, and can be set via environ: \"MODAPI_SECRET_KEY\"")
      end

      @secret_key = secret_key.to_s

      super(
        base_url: base_url,
        timeout: timeout,
        max_retries: max_retries,
        initial_retry_delay: initial_retry_delay,
        max_retry_delay: max_retry_delay
      )

      @authors = ModerationAPI::Resources::Authors.new(client: self)
      @queue = ModerationAPI::Resources::Queue.new(client: self)
      @actions = ModerationAPI::Resources::Actions.new(client: self)
      @content = ModerationAPI::Resources::Content.new(client: self)
      @account = ModerationAPI::Resources::Account.new(client: self)
      @auth = ModerationAPI::Resources::Auth.new(client: self)
      @wordlist = ModerationAPI::Resources::Wordlist.new(client: self)
    end
  end
end
