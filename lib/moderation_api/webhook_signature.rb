# frozen_string_literal: true

# Verify webhook deliveries from Moderation API.
#
# Every delivery is signed with HMAC-SHA256 over the raw request body, using
# your project's webhook signing secret. The hex-encoded signature is in the
# `modapi-signature` header.
#
# Maintained by hand in moderation-api/sdk-generator (custom/ruby), not generated.

require "json"
require "openssl"

module ModerationApi
  module WebhookSignature
    HEADER = "modapi-signature"
    SECRET_ENV_VAR = "MODAPI_WEBHOOK_SECRET"

    # The webhook signature is missing or does not match the payload.
    class VerificationError < StandardError; end

    module_function

    # Return the hex HMAC-SHA256 signature for a raw payload.
    def compute_signature(payload, secret)
      OpenSSL::HMAC.hexdigest("SHA256", secret, payload)
    end

    # Return true if signature matches the raw payload.
    # secret defaults to the MODAPI_WEBHOOK_SECRET environment variable.
    def verify(payload, signature, secret = nil)
      secret = ENV.fetch(SECRET_ENV_VAR, nil) if secret.nil? || secret.empty?
      return false if signature.nil? || signature.empty? || secret.nil? || secret.empty?

      expected = compute_signature(payload, secret)
      given = signature.strip.downcase
      return false unless expected.bytesize == given.bytesize

      OpenSSL.fixed_length_secure_compare(expected, given)
    end

    # Verify a delivery and return the parsed event (a Hash).
    #
    # Pass the raw request body exactly as received and the value of the
    # `modapi-signature` header. secret defaults to the MODAPI_WEBHOOK_SECRET
    # environment variable.
    #
    # Raises VerificationError when the signature does not match.
    def construct_event(payload, signature, secret = nil)
      raise VerificationError, "Webhook signature does not match the payload" unless verify(payload, signature, secret)

      JSON.parse(payload)
    end
  end
end
