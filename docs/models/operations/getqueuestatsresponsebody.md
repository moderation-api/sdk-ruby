# GetQueueStatsResponseBody

Successful response


## Fields

| Field                                                                               | Type                                                                                | Required                                                                            | Description                                                                         |
| ----------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------- |
| `review_stats`                                                                      | [Models::Operations::ReviewStats](../../models/operations/reviewstats.md)           | :heavy_check_mark:                                                                  | N/A                                                                                 |
| `action_stats`                                                                      | T::Array<[Models::Operations::ActionStat](../../models/operations/actionstat.md)>   | :heavy_check_mark:                                                                  | N/A                                                                                 |
| `top_reviewers`                                                                     | T::Array<[Models::Operations::TopReviewer](../../models/operations/topreviewer.md)> | :heavy_check_mark:                                                                  | List of top reviewers and their statistics                                          |
| `trends`                                                                            | [Models::Operations::Trends](../../models/operations/trends.md)                     | :heavy_check_mark:                                                                  | N/A                                                                                 |