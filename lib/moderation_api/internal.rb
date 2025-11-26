# frozen_string_literal: true

module ModerationAPI
  module Internal
    extend ModerationAPI::Internal::Util::SorbetRuntimeSupport

    OMIT =
      Object.new.tap do
        _1.define_singleton_method(:inspect) { "#<#{ModerationAPI::Internal}::OMIT>" }
      end
        .freeze

    define_sorbet_constant!(:AnyHash) do
      T.type_alias { T::Hash[Symbol, T.anything] }
    end
    define_sorbet_constant!(:FileInput) do
      T.type_alias { T.any(Pathname, StringIO, IO, String, ModerationAPI::FilePart) }
    end
  end
end
