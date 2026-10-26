# QueueWithCounts


## Fields

| Field                                                  | Type                                                   | Required                                               | Description                                            |
| ------------------------------------------------------ | ------------------------------------------------------ | ------------------------------------------------------ | ------------------------------------------------------ |
| `id`                                                   | *::String*                                             | :heavy_check_mark:                                     | The queue ID.                                          |
| `name`                                                 | *::String*                                             | :heavy_check_mark:                                     | The queue name.                                        |
| `description`                                          | *T.nilable(::String)*                                  | :heavy_check_mark:                                     | The queue description.                                 |
| `is_default`                                           | *T::Boolean*                                           | :heavy_check_mark:                                     | Whether this is the default queue of the project.      |
| `unresolved_items_count`                               | *::Integer*                                            | :heavy_check_mark:                                     | Number of items that wait for review.                  |
| `resolved_items_count`                                 | *::Integer*                                            | :heavy_check_mark:                                     | Number of items that are resolved.                     |
| `total_items_count`                                    | *::Integer*                                            | :heavy_check_mark:                                     | Number of items in the queue, resolved and unresolved. |