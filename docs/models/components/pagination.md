# Pagination

Where this page is in the full list.


## Fields

| Field                            | Type                             | Required                         | Description                      |
| -------------------------------- | -------------------------------- | -------------------------------- | -------------------------------- |
| `page`                           | *::Integer*                      | :heavy_check_mark:               | The current page, starting at 1. |
| `page_size`                      | *::Integer*                      | :heavy_check_mark:               | Number of items per page.        |
| `total`                          | *::Integer*                      | :heavy_check_mark:               | Total number of items.           |
| `total_pages`                    | *::Integer*                      | :heavy_check_mark:               | Total number of pages.           |
| `has_more`                       | *T::Boolean*                     | :heavy_check_mark:               | Whether there is a next page.    |