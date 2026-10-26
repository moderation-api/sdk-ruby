# GetAnalyticsAuthorsAuthor


## Fields

| Field                                                              | Type                                                               | Required                                                           | Description                                                        |
| ------------------------------------------------------------------ | ------------------------------------------------------------------ | ------------------------------------------------------------------ | ------------------------------------------------------------------ |
| `author_id`                                                        | *::String*                                                         | :heavy_check_mark:                                                 | The author ID from your system. Use it with the authors endpoints. |
| `name`                                                             | *T.nilable(::String)*                                              | :heavy_check_mark:                                                 | The author name, if known.                                         |
| `flagged`                                                          | *::Integer*                                                        | :heavy_check_mark:                                                 | Flagged requests from this author in the window.                   |