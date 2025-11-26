# typed: strong

module ModerationAPI
  module Models
    class QueueGetStatsResponse < ModerationAPI::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            ModerationAPI::Models::QueueGetStatsResponse,
            ModerationAPI::Internal::AnyHash
          )
        end

      sig do
        returns(
          T::Array[ModerationAPI::Models::QueueGetStatsResponse::ActionStat]
        )
      end
      attr_accessor :action_stats

      sig { returns(ModerationAPI::Models::QueueGetStatsResponse::ReviewStats) }
      attr_reader :review_stats

      sig do
        params(
          review_stats:
            ModerationAPI::Models::QueueGetStatsResponse::ReviewStats::OrHash
        ).void
      end
      attr_writer :review_stats

      # List of top reviewers and their statistics
      sig do
        returns(
          T::Array[ModerationAPI::Models::QueueGetStatsResponse::TopReviewer]
        )
      end
      attr_accessor :top_reviewers

      sig { returns(ModerationAPI::Models::QueueGetStatsResponse::Trends) }
      attr_reader :trends

      sig do
        params(
          trends: ModerationAPI::Models::QueueGetStatsResponse::Trends::OrHash
        ).void
      end
      attr_writer :trends

      sig do
        params(
          action_stats:
            T::Array[
              ModerationAPI::Models::QueueGetStatsResponse::ActionStat::OrHash
            ],
          review_stats:
            ModerationAPI::Models::QueueGetStatsResponse::ReviewStats::OrHash,
          top_reviewers:
            T::Array[
              ModerationAPI::Models::QueueGetStatsResponse::TopReviewer::OrHash
            ],
          trends: ModerationAPI::Models::QueueGetStatsResponse::Trends::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        action_stats:,
        review_stats:,
        # List of top reviewers and their statistics
        top_reviewers:,
        trends:
      )
      end

      sig do
        override.returns(
          {
            action_stats:
              T::Array[
                ModerationAPI::Models::QueueGetStatsResponse::ActionStat
              ],
            review_stats:
              ModerationAPI::Models::QueueGetStatsResponse::ReviewStats,
            top_reviewers:
              T::Array[
                ModerationAPI::Models::QueueGetStatsResponse::TopReviewer
              ],
            trends: ModerationAPI::Models::QueueGetStatsResponse::Trends
          }
        )
      end
      def to_hash
      end

      class ActionStat < ModerationAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ModerationAPI::Models::QueueGetStatsResponse::ActionStat,
              ModerationAPI::Internal::AnyHash
            )
          end

        # ID of the moderation action
        sig { returns(String) }
        attr_accessor :action_id

        # Name of the moderation action
        sig { returns(String) }
        attr_accessor :action_name

        # Number of times this action was taken
        sig { returns(Float) }
        attr_accessor :count

        # Percentage this action represents of all actions
        sig { returns(Float) }
        attr_accessor :percentage_of_total

        sig do
          params(
            action_id: String,
            action_name: String,
            count: Float,
            percentage_of_total: Float
          ).returns(T.attached_class)
        end
        def self.new(
          # ID of the moderation action
          action_id:,
          # Name of the moderation action
          action_name:,
          # Number of times this action was taken
          count:,
          # Percentage this action represents of all actions
          percentage_of_total:
        )
        end

        sig do
          override.returns(
            {
              action_id: String,
              action_name: String,
              count: Float,
              percentage_of_total: Float
            }
          )
        end
        def to_hash
        end
      end

      class ReviewStats < ModerationAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ModerationAPI::Models::QueueGetStatsResponse::ReviewStats,
              ModerationAPI::Internal::AnyHash
            )
          end

        # Average time in milliseconds to review an item
        sig { returns(Float) }
        attr_accessor :average_time_to_review

        # Total number of items pending review
        sig { returns(Float) }
        attr_accessor :total_pending

        # Total number of items reviewed
        sig { returns(Float) }
        attr_accessor :total_reviewed

        sig do
          params(
            average_time_to_review: Float,
            total_pending: Float,
            total_reviewed: Float
          ).returns(T.attached_class)
        end
        def self.new(
          # Average time in milliseconds to review an item
          average_time_to_review:,
          # Total number of items pending review
          total_pending:,
          # Total number of items reviewed
          total_reviewed:
        )
        end

        sig do
          override.returns(
            {
              average_time_to_review: Float,
              total_pending: Float,
              total_reviewed: Float
            }
          )
        end
        def to_hash
        end
      end

      class TopReviewer < ModerationAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ModerationAPI::Models::QueueGetStatsResponse::TopReviewer,
              ModerationAPI::Internal::AnyHash
            )
          end

        # Average review time in milliseconds
        sig { returns(Float) }
        attr_accessor :average_time_per_review

        # Name of the reviewer
        sig { returns(String) }
        attr_accessor :name

        # Number of items reviewed
        sig { returns(Float) }
        attr_accessor :review_count

        # Most common actions taken by this reviewer
        sig do
          returns(
            T::Array[
              ModerationAPI::Models::QueueGetStatsResponse::TopReviewer::TopAction
            ]
          )
        end
        attr_accessor :top_actions

        # ID of the reviewer
        sig { returns(String) }
        attr_accessor :user_id

        # Optional accuracy score based on review quality metrics
        sig { returns(T.nilable(Float)) }
        attr_reader :accuracy_score

        sig { params(accuracy_score: Float).void }
        attr_writer :accuracy_score

        sig do
          params(
            average_time_per_review: Float,
            name: String,
            review_count: Float,
            top_actions:
              T::Array[
                ModerationAPI::Models::QueueGetStatsResponse::TopReviewer::TopAction::OrHash
              ],
            user_id: String,
            accuracy_score: Float
          ).returns(T.attached_class)
        end
        def self.new(
          # Average review time in milliseconds
          average_time_per_review:,
          # Name of the reviewer
          name:,
          # Number of items reviewed
          review_count:,
          # Most common actions taken by this reviewer
          top_actions:,
          # ID of the reviewer
          user_id:,
          # Optional accuracy score based on review quality metrics
          accuracy_score: nil
        )
        end

        sig do
          override.returns(
            {
              average_time_per_review: Float,
              name: String,
              review_count: Float,
              top_actions:
                T::Array[
                  ModerationAPI::Models::QueueGetStatsResponse::TopReviewer::TopAction
                ],
              user_id: String,
              accuracy_score: Float
            }
          )
        end
        def to_hash
        end

        class TopAction < ModerationAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ModerationAPI::Models::QueueGetStatsResponse::TopReviewer::TopAction,
                ModerationAPI::Internal::AnyHash
              )
            end

          # Most used action by this reviewer
          sig { returns(String) }
          attr_accessor :action_id

          # Name of the most used action
          sig { returns(String) }
          attr_accessor :action_name

          # Number of times this action was used
          sig { returns(Float) }
          attr_accessor :count

          sig do
            params(
              action_id: String,
              action_name: String,
              count: Float
            ).returns(T.attached_class)
          end
          def self.new(
            # Most used action by this reviewer
            action_id:,
            # Name of the most used action
            action_name:,
            # Number of times this action was used
            count:
          )
          end

          sig do
            override.returns(
              { action_id: String, action_name: String, count: Float }
            )
          end
          def to_hash
          end
        end
      end

      class Trends < ModerationAPI::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ModerationAPI::Models::QueueGetStatsResponse::Trends,
              ModerationAPI::Internal::AnyHash
            )
          end

        sig do
          returns(
            T::Array[
              ModerationAPI::Models::QueueGetStatsResponse::Trends::DailyReviewCount
            ]
          )
        end
        attr_accessor :daily_review_counts

        sig do
          returns(
            T::Array[
              ModerationAPI::Models::QueueGetStatsResponse::Trends::FlaggedContentTrend
            ]
          )
        end
        attr_accessor :flagged_content_trends

        sig do
          params(
            daily_review_counts:
              T::Array[
                ModerationAPI::Models::QueueGetStatsResponse::Trends::DailyReviewCount::OrHash
              ],
            flagged_content_trends:
              T::Array[
                ModerationAPI::Models::QueueGetStatsResponse::Trends::FlaggedContentTrend::OrHash
              ]
          ).returns(T.attached_class)
        end
        def self.new(daily_review_counts:, flagged_content_trends:)
        end

        sig do
          override.returns(
            {
              daily_review_counts:
                T::Array[
                  ModerationAPI::Models::QueueGetStatsResponse::Trends::DailyReviewCount
                ],
              flagged_content_trends:
                T::Array[
                  ModerationAPI::Models::QueueGetStatsResponse::Trends::FlaggedContentTrend
                ]
            }
          )
        end
        def to_hash
        end

        class DailyReviewCount < ModerationAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ModerationAPI::Models::QueueGetStatsResponse::Trends::DailyReviewCount,
                ModerationAPI::Internal::AnyHash
              )
            end

          # Number of reviews on this date
          sig { returns(Float) }
          attr_accessor :count

          # Date in YYYY-MM-DD format
          sig { returns(String) }
          attr_accessor :date

          sig { params(count: Float, date: String).returns(T.attached_class) }
          def self.new(
            # Number of reviews on this date
            count:,
            # Date in YYYY-MM-DD format
            date:
          )
          end

          sig { override.returns({ count: Float, date: String }) }
          def to_hash
          end
        end

        class FlaggedContentTrend < ModerationAPI::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ModerationAPI::Models::QueueGetStatsResponse::Trends::FlaggedContentTrend,
                ModerationAPI::Internal::AnyHash
              )
            end

          # Content flag/label
          sig { returns(String) }
          attr_accessor :label

          # Trend indicator (-1 to 1) showing if this type of flagged content is increasing
          # or decreasing
          sig { returns(Float) }
          attr_accessor :trend

          sig { params(label: String, trend: Float).returns(T.attached_class) }
          def self.new(
            # Content flag/label
            label:,
            # Trend indicator (-1 to 1) showing if this type of flagged content is increasing
            # or decreasing
            trend:
          )
          end

          sig { override.returns({ label: String, trend: Float }) }
          def to_hash
          end
        end
      end
    end
  end
end
