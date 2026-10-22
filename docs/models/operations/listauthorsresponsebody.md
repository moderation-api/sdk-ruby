# ListAuthorsResponseBody

Successful response


## Fields

| Field                                                                             | Type                                                                              | Required                                                                          | Description                                                                       |
| --------------------------------------------------------------------------------- | --------------------------------------------------------------------------------- | --------------------------------------------------------------------------------- | --------------------------------------------------------------------------------- |
| `data`                                                                            | T::Array<[Models::Components::PublicAuthor](../../models/shared/publicauthor.md)> | :heavy_check_mark:                                                                | The items on this page.                                                           |
| `pagination`                                                                      | [Models::Components::Pagination](../../models/shared/pagination.md)               | :heavy_check_mark:                                                                | Where this page is in the full list.                                              |