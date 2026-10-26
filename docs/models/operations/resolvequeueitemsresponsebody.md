# ResolveQueueItemsResponseBody

Successful response


## Fields

| Field                                      | Type                                       | Required                                   | Description                                |
| ------------------------------------------ | ------------------------------------------ | ------------------------------------------ | ------------------------------------------ |
| `resolved`                                 | *::Integer*                                | :heavy_check_mark:                         | Number of items resolved.                  |
| `not_found_ids`                            | T::Array<*::String*>                       | :heavy_check_mark:                         | Item IDs that do not exist in the project. |