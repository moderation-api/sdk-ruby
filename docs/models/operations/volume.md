# Volume


## Fields

| Field                                                    | Type                                                     | Required                                                 | Description                                              |
| -------------------------------------------------------- | -------------------------------------------------------- | -------------------------------------------------------- | -------------------------------------------------------- |
| `start`                                                  | *::String*                                               | :heavy_check_mark:                                       | Start of the bucket, as an ISO 8601 timestamp in UTC.    |
| `requests`                                               | *::Integer*                                              | :heavy_check_mark:                                       | Requests received in the bucket.                         |
| `flagged`                                                | *::Integer*                                              | :heavy_check_mark:                                       | Requests flagged in the bucket.                          |
| `rejected`                                               | *::Integer*                                              | :heavy_check_mark:                                       | Requests with the recommendation "reject" in the bucket. |
| `sent_to_review`                                         | *::Integer*                                              | :heavy_check_mark:                                       | Requests with the recommendation "review" in the bucket. |