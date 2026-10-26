# TopReviewer


## Fields

| Field                                                                   | Type                                                                    | Required                                                                | Description                                                             |
| ----------------------------------------------------------------------- | ----------------------------------------------------------------------- | ----------------------------------------------------------------------- | ----------------------------------------------------------------------- |
| `user_id`                                                               | *T.nilable(::String)*                                                   | :heavy_check_mark:                                                      | The user ID of the reviewer. `null` for items resolved with an API key. |
| `name`                                                                  | *T.nilable(::String)*                                                   | :heavy_check_mark:                                                      | The name of the reviewer.                                               |
| `review_count`                                                          | *::Integer*                                                             | :heavy_check_mark:                                                      | Number of items the reviewer resolved in the period.                    |