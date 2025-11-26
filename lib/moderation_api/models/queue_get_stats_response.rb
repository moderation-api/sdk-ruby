# frozen_string_literal: true

module ModerationAPI
  module Models
    # @see ModerationAPI::Resources::Queue#get_stats
    class QueueGetStatsResponse < ModerationAPI::Internal::Type::BaseModel
      # @!attribute action_stats
      #
      #   @return [Array<ModerationAPI::Models::QueueGetStatsResponse::ActionStat>]
      required :action_stats,
               -> { ModerationAPI::Internal::Type::ArrayOf[ModerationAPI::Models::QueueGetStatsResponse::ActionStat] },
               api_name: :actionStats

      # @!attribute review_stats
      #
      #   @return [ModerationAPI::Models::QueueGetStatsResponse::ReviewStats]
      required :review_stats,
               -> { ModerationAPI::Models::QueueGetStatsResponse::ReviewStats },
               api_name: :reviewStats

      # @!attribute top_reviewers
      #   List of top reviewers and their statistics
      #
      #   @return [Array<ModerationAPI::Models::QueueGetStatsResponse::TopReviewer>]
      required :top_reviewers,
               -> { ModerationAPI::Internal::Type::ArrayOf[ModerationAPI::Models::QueueGetStatsResponse::TopReviewer] },
               api_name: :topReviewers

      # @!attribute trends
      #
      #   @return [ModerationAPI::Models::QueueGetStatsResponse::Trends]
      required :trends, -> { ModerationAPI::Models::QueueGetStatsResponse::Trends }

      # @!method initialize(action_stats:, review_stats:, top_reviewers:, trends:)
      #   @param action_stats [Array<ModerationAPI::Models::QueueGetStatsResponse::ActionStat>]
      #
      #   @param review_stats [ModerationAPI::Models::QueueGetStatsResponse::ReviewStats]
      #
      #   @param top_reviewers [Array<ModerationAPI::Models::QueueGetStatsResponse::TopReviewer>] List of top reviewers and their statistics
      #
      #   @param trends [ModerationAPI::Models::QueueGetStatsResponse::Trends]

      class ActionStat < ModerationAPI::Internal::Type::BaseModel
        # @!attribute action_id
        #   ID of the moderation action
        #
        #   @return [String]
        required :action_id, String, api_name: :actionId

        # @!attribute action_name
        #   Name of the moderation action
        #
        #   @return [String]
        required :action_name, String, api_name: :actionName

        # @!attribute count
        #   Number of times this action was taken
        #
        #   @return [Float]
        required :count, Float

        # @!attribute percentage_of_total
        #   Percentage this action represents of all actions
        #
        #   @return [Float]
        required :percentage_of_total, Float, api_name: :percentageOfTotal

        # @!method initialize(action_id:, action_name:, count:, percentage_of_total:)
        #   @param action_id [String] ID of the moderation action
        #
        #   @param action_name [String] Name of the moderation action
        #
        #   @param count [Float] Number of times this action was taken
        #
        #   @param percentage_of_total [Float] Percentage this action represents of all actions
      end

      # @see ModerationAPI::Models::QueueGetStatsResponse#review_stats
      class ReviewStats < ModerationAPI::Internal::Type::BaseModel
        # @!attribute average_time_to_review
        #   Average time in milliseconds to review an item
        #
        #   @return [Float]
        required :average_time_to_review, Float, api_name: :averageTimeToReview

        # @!attribute total_pending
        #   Total number of items pending review
        #
        #   @return [Float]
        required :total_pending, Float, api_name: :totalPending

        # @!attribute total_reviewed
        #   Total number of items reviewed
        #
        #   @return [Float]
        required :total_reviewed, Float, api_name: :totalReviewed

        # @!method initialize(average_time_to_review:, total_pending:, total_reviewed:)
        #   @param average_time_to_review [Float] Average time in milliseconds to review an item
        #
        #   @param total_pending [Float] Total number of items pending review
        #
        #   @param total_reviewed [Float] Total number of items reviewed
      end

      class TopReviewer < ModerationAPI::Internal::Type::BaseModel
        # @!attribute average_time_per_review
        #   Average review time in milliseconds
        #
        #   @return [Float]
        required :average_time_per_review, Float, api_name: :averageTimePerReview

        # @!attribute name
        #   Name of the reviewer
        #
        #   @return [String]
        required :name, String

        # @!attribute review_count
        #   Number of items reviewed
        #
        #   @return [Float]
        required :review_count, Float, api_name: :reviewCount

        # @!attribute top_actions
        #   Most common actions taken by this reviewer
        #
        #   @return [Array<ModerationAPI::Models::QueueGetStatsResponse::TopReviewer::TopAction>]
        required :top_actions,
                 -> { ModerationAPI::Internal::Type::ArrayOf[ModerationAPI::Models::QueueGetStatsResponse::TopReviewer::TopAction] },
                 api_name: :topActions

        # @!attribute user_id
        #   ID of the reviewer
        #
        #   @return [String]
        required :user_id, String, api_name: :userId

        # @!attribute accuracy_score
        #   Optional accuracy score based on review quality metrics
        #
        #   @return [Float, nil]
        optional :accuracy_score, Float, api_name: :accuracyScore

        # @!method initialize(average_time_per_review:, name:, review_count:, top_actions:, user_id:, accuracy_score: nil)
        #   @param average_time_per_review [Float] Average review time in milliseconds
        #
        #   @param name [String] Name of the reviewer
        #
        #   @param review_count [Float] Number of items reviewed
        #
        #   @param top_actions [Array<ModerationAPI::Models::QueueGetStatsResponse::TopReviewer::TopAction>] Most common actions taken by this reviewer
        #
        #   @param user_id [String] ID of the reviewer
        #
        #   @param accuracy_score [Float] Optional accuracy score based on review quality metrics

        class TopAction < ModerationAPI::Internal::Type::BaseModel
          # @!attribute action_id
          #   Most used action by this reviewer
          #
          #   @return [String]
          required :action_id, String, api_name: :actionId

          # @!attribute action_name
          #   Name of the most used action
          #
          #   @return [String]
          required :action_name, String, api_name: :actionName

          # @!attribute count
          #   Number of times this action was used
          #
          #   @return [Float]
          required :count, Float

          # @!method initialize(action_id:, action_name:, count:)
          #   @param action_id [String] Most used action by this reviewer
          #
          #   @param action_name [String] Name of the most used action
          #
          #   @param count [Float] Number of times this action was used
        end
      end

      # @see ModerationAPI::Models::QueueGetStatsResponse#trends
      class Trends < ModerationAPI::Internal::Type::BaseModel
        # @!attribute daily_review_counts
        #
        #   @return [Array<ModerationAPI::Models::QueueGetStatsResponse::Trends::DailyReviewCount>]
        required :daily_review_counts,
                 -> { ModerationAPI::Internal::Type::ArrayOf[ModerationAPI::Models::QueueGetStatsResponse::Trends::DailyReviewCount] },
                 api_name: :dailyReviewCounts

        # @!attribute flagged_content_trends
        #
        #   @return [Array<ModerationAPI::Models::QueueGetStatsResponse::Trends::FlaggedContentTrend>]
        required :flagged_content_trends,
                 -> { ModerationAPI::Internal::Type::ArrayOf[ModerationAPI::Models::QueueGetStatsResponse::Trends::FlaggedContentTrend] },
                 api_name: :flaggedContentTrends

        # @!method initialize(daily_review_counts:, flagged_content_trends:)
        #   @param daily_review_counts [Array<ModerationAPI::Models::QueueGetStatsResponse::Trends::DailyReviewCount>]
        #   @param flagged_content_trends [Array<ModerationAPI::Models::QueueGetStatsResponse::Trends::FlaggedContentTrend>]

        class DailyReviewCount < ModerationAPI::Internal::Type::BaseModel
          # @!attribute count
          #   Number of reviews on this date
          #
          #   @return [Float]
          required :count, Float

          # @!attribute date
          #   Date in YYYY-MM-DD format
          #
          #   @return [String]
          required :date, String

          # @!method initialize(count:, date:)
          #   @param count [Float] Number of reviews on this date
          #
          #   @param date [String] Date in YYYY-MM-DD format
        end

        class FlaggedContentTrend < ModerationAPI::Internal::Type::BaseModel
          # @!attribute label
          #   Content flag/label
          #
          #   @return [String]
          required :label, String

          # @!attribute trend
          #   Trend indicator (-1 to 1) showing if this type of flagged content is increasing
          #   or decreasing
          #
          #   @return [Float]
          required :trend, Float

          # @!method initialize(label:, trend:)
          #   Some parameter documentations has been truncated, see
          #   {ModerationAPI::Models::QueueGetStatsResponse::Trends::FlaggedContentTrend} for
          #   more details.
          #
          #   @param label [String] Content flag/label
          #
          #   @param trend [Float] Trend indicator (-1 to 1) showing if this type of flagged content is increasing
        end
      end
    end
  end
end
