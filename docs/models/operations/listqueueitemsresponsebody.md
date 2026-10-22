# ListQueueItemsResponseBody

Successful response


## Fields

| Field                                                                                             | Type                                                                                              | Required                                                                                          | Description                                                                                       |
| ------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------- |
| `data`                                                                                            | T::Array<[Models::Operations::ListQueueItemsData](../../models/operations/listqueueitemsdata.md)> | :heavy_check_mark:                                                                                | The items on this page.                                                                           |
| `pagination`                                                                                      | [Models::Components::Pagination](../../models/shared/pagination.md)                               | :heavy_check_mark:                                                                                | Where this page is in the full list.                                                              |