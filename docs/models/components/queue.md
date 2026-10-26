# Queue


## Fields

| Field                                             | Type                                              | Required                                          | Description                                       |
| ------------------------------------------------- | ------------------------------------------------- | ------------------------------------------------- | ------------------------------------------------- |
| `id`                                              | *::String*                                        | :heavy_check_mark:                                | The queue ID.                                     |
| `name`                                            | *::String*                                        | :heavy_check_mark:                                | The queue name.                                   |
| `description`                                     | *T.nilable(::String)*                             | :heavy_check_mark:                                | The queue description.                            |
| `is_default`                                      | *T::Boolean*                                      | :heavy_check_mark:                                | Whether this is the default queue of the project. |