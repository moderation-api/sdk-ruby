# ExecuteActionRequest

Input parameters


## Fields

| Field                                                                       | Type                                                                        | Required                                                                    | Description                                                                 |
| --------------------------------------------------------------------------- | --------------------------------------------------------------------------- | --------------------------------------------------------------------------- | --------------------------------------------------------------------------- |
| `action_key`                                                                | *::String*                                                                  | :heavy_check_mark:                                                          | ID or key of the action to execute                                          |
| `content_ids`                                                               | T::Array<*::String*>                                                        | :heavy_minus_sign:                                                          | IDs of the content items to apply the action to. Provide this or authorIds. |
| `author_ids`                                                                | T::Array<*::String*>                                                        | :heavy_minus_sign:                                                          | IDs of the authors to apply the action to. Provide this or contentIds.      |
| `value`                                                                     | *T.nilable(::String)*                                                       | :heavy_minus_sign:                                                          | Optional value to provide with the action                                   |
| `queue_id`                                                                  | *T.nilable(::String)*                                                       | :heavy_minus_sign:                                                          | Optional queue ID if the action is queue-specific                           |
| `duration`                                                                  | *T.nilable(::Float)*                                                        | :heavy_minus_sign:                                                          | Optional duration in milliseconds for actions with timeouts                 |