# UpdateWordlistResponseBody

Wordlist updated successfully


## Fields

| Field                         | Type                          | Required                      | Description                   |
| ----------------------------- | ----------------------------- | ----------------------------- | ----------------------------- |
| `id`                          | *::String*                    | :heavy_check_mark:            | ID of the wordlist            |
| `name`                        | *T.nilable(::String)*         | :heavy_check_mark:            | N/A                           |
| `words`                       | T::Array<*::String*>          | :heavy_check_mark:            | Words in the wordlist         |
| `created_at`                  | *::String*                    | :heavy_check_mark:            | Creation date of the wordlist |
| `organization_id`             | *::String*                    | :heavy_check_mark:            | ID of the organization        |
| `user_id`                     | *T.nilable(::String)*         | :heavy_check_mark:            | N/A                           |
| `strict`                      | *T::Boolean*                  | :heavy_check_mark:            | Strict mode                   |