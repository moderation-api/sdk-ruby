# ErrorIssue


## Fields

| Field                                                             | Type                                                              | Required                                                          | Description                                                       |
| ----------------------------------------------------------------- | ----------------------------------------------------------------- | ----------------------------------------------------------------- | ----------------------------------------------------------------- |
| `message`                                                         | *::String*                                                        | :heavy_check_mark:                                                | What is wrong.                                                    |
| `path`                                                            | T::Array<[T.any(::String, ::Float)](../../models/shared/path.md)> | :heavy_minus_sign:                                                | Location of the invalid field in the request body.                |
| `code`                                                            | *T.nilable(::String)*                                             | :heavy_minus_sign:                                                | Validation rule that failed.                                      |