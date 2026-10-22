# ListWordlistsData


## Fields

| Field                             | Type                              | Required                          | Description                       |
| --------------------------------- | --------------------------------- | --------------------------------- | --------------------------------- |
| `id`                              | *::String*                        | :heavy_check_mark:                | Unique identifier of the wordlist |
| `name`                            | *T.nilable(::String)*             | :heavy_check_mark:                | Name of the wordlist              |
| `description`                     | *T.nilable(::String)*             | :heavy_check_mark:                | Description of the wordlist       |
| `created_at`                      | *T.nilable(::String)*             | :heavy_check_mark:                | When the wordlist was created     |
| `user_id`                         | *T.nilable(::String)*             | :heavy_check_mark:                | User who created the wordlist     |