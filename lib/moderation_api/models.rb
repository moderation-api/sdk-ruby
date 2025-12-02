# frozen_string_literal: true

module ModerationAPI
  [
    ModerationAPI::Internal::Type::BaseModel,
    *ModerationAPI::Internal::Type::BaseModel.subclasses
  ].each do |cls|
    cls.define_sorbet_constant!(:OrHash) { T.type_alias { T.any(cls, ModerationAPI::Internal::AnyHash) } }
  end

  ModerationAPI::Internal::Util.walk_namespaces(ModerationAPI::Models).each do |mod|
    case mod
    in ModerationAPI::Internal::Type::Enum | ModerationAPI::Internal::Type::Union
      mod.constants.each do |name|
        case mod.const_get(name)
        in true | false
          mod.define_sorbet_constant!(:TaggedBoolean) { T.type_alias { T::Boolean } }
          mod.define_sorbet_constant!(:OrBoolean) { T.type_alias { T::Boolean } }
        in Integer
          mod.define_sorbet_constant!(:TaggedInteger) { T.type_alias { Integer } }
          mod.define_sorbet_constant!(:OrInteger) { T.type_alias { Integer } }
        in Float
          mod.define_sorbet_constant!(:TaggedFloat) { T.type_alias { Float } }
          mod.define_sorbet_constant!(:OrFloat) { T.type_alias { Float } }
        in Symbol
          mod.define_sorbet_constant!(:TaggedSymbol) { T.type_alias { Symbol } }
          mod.define_sorbet_constant!(:OrSymbol) { T.type_alias { T.any(Symbol, String) } }
        else
        end
      end
    else
    end
  end

  ModerationAPI::Internal::Util.walk_namespaces(ModerationAPI::Models)
                               .lazy
                               .grep(ModerationAPI::Internal::Type::Union)
                               .each do |mod|
    const = :Variants
    next if mod.sorbet_constant_defined?(const)

    mod.define_sorbet_constant!(const) { T.type_alias { mod.to_sorbet_type } }
  end

  AccountListParams = ModerationAPI::Models::AccountListParams

  ActionCreateParams = ModerationAPI::Models::ActionCreateParams

  ActionDeleteParams = ModerationAPI::Models::ActionDeleteParams

  ActionListParams = ModerationAPI::Models::ActionListParams

  ActionRetrieveParams = ModerationAPI::Models::ActionRetrieveParams

  Actions = ModerationAPI::Models::Actions

  ActionUpdateParams = ModerationAPI::Models::ActionUpdateParams

  AuthCreateParams = ModerationAPI::Models::AuthCreateParams

  AuthorCreateParams = ModerationAPI::Models::AuthorCreateParams

  AuthorDeleteParams = ModerationAPI::Models::AuthorDeleteParams

  AuthorListParams = ModerationAPI::Models::AuthorListParams

  AuthorRetrieveParams = ModerationAPI::Models::AuthorRetrieveParams

  AuthorUpdateParams = ModerationAPI::Models::AuthorUpdateParams

  AuthRetrieveParams = ModerationAPI::Models::AuthRetrieveParams

  ModerateAnalyzeParams = ModerationAPI::Models::ModerateAnalyzeParams

  Queue = ModerationAPI::Models::Queue

  QueueGetStatsParams = ModerationAPI::Models::QueueGetStatsParams

  QueueRetrieveParams = ModerationAPI::Models::QueueRetrieveParams

  Wordlist = ModerationAPI::Models::Wordlist

  WordlistGetEmbeddingStatusParams = ModerationAPI::Models::WordlistGetEmbeddingStatusParams

  WordlistListParams = ModerationAPI::Models::WordlistListParams

  WordlistRetrieveParams = ModerationAPI::Models::WordlistRetrieveParams

  WordlistUpdateParams = ModerationAPI::Models::WordlistUpdateParams
end
