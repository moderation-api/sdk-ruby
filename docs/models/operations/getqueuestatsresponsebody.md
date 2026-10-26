# GetQueueStatsResponseBody

Successful response


## Fields

| Field                                                                               | Type                                                                                | Required                                                                            | Description                                                                         |
| ----------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------- |
| `review_stats`                                                                      | [Models::Operations::ReviewStats](../../models/operations/reviewstats.md)           | :heavy_check_mark:                                                                  | N/A                                                                                 |
| `top_reviewers`                                                                     | T::Array<[Models::Operations::TopReviewer](../../models/operations/topreviewer.md)> | :heavy_check_mark:                                                                  | Reviewers with the most resolved items, most first. Up to 10.                       |
| `trends`                                                                            | [Models::Operations::Trends](../../models/operations/trends.md)                     | :heavy_check_mark:                                                                  | N/A                                                                                 |