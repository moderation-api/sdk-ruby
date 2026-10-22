# ListQueueItemsAction


## Fields

| Field                                       | Type                                        | Required                                    | Description                                 |
| ------------------------------------------- | ------------------------------------------- | ------------------------------------------- | ------------------------------------------- |
| `id`                                        | *::String*                                  | :heavy_check_mark:                          | Action ID                                   |
| `name`                                      | *::String*                                  | :heavy_check_mark:                          | Action name                                 |
| `comment`                                   | *T.nilable(::String)*                       | :heavy_minus_sign:                          | Action comment                              |
| `timestamp`                                 | *::Float*                                   | :heavy_check_mark:                          | Unix timestamp of when the action was taken |
| `reviewer`                                  | *T.nilable(::String)*                       | :heavy_minus_sign:                          | Moderator userID                            |