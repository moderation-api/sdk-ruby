# UnresolveQueueItemResponseBody

Successful response


## Fields

| Field                                                                                               | Type                                                                                                | Required                                                                                            | Description                                                                                         |
| --------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------- |
| `success`                                                                                           | *T::Boolean*                                                                                        | :heavy_check_mark:                                                                                  | N/A                                                                                                 |
| `status`                                                                                            | [Models::Operations::UnresolveQueueItemStatus](../../models/operations/unresolvequeueitemstatus.md) | :heavy_check_mark:                                                                                  | `pending` waits for review. `resolved` is reviewed.                                                 |
| `unresolved_at`                                                                                     | *::String*                                                                                          | :heavy_check_mark:                                                                                  | When the item was unresolved (ISO 8601).                                                            |