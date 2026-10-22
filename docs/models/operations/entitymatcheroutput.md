# EntityMatcherOutput

Entity matcher policy.


## Fields

| Field                                                                   | Type                                                                    | Required                                                                | Description                                                             |
| ----------------------------------------------------------------------- | ----------------------------------------------------------------------- | ----------------------------------------------------------------------- | ----------------------------------------------------------------------- |
| `id`                                                                    | *::String*                                                              | :heavy_check_mark:                                                      | N/A                                                                     |
| `type`                                                                  | *::String*                                                              | :heavy_check_mark:                                                      | N/A                                                                     |
| `probability`                                                           | *::Float*                                                               | :heavy_check_mark:                                                      | N/A                                                                     |
| `flagged`                                                               | *T::Boolean*                                                            | :heavy_check_mark:                                                      | N/A                                                                     |
| `flagged_fields`                                                        | T::Array<*::String*>                                                    | :heavy_minus_sign:                                                      | N/A                                                                     |
| `matches`                                                               | T::Array<[Models::Operations::Match](../../models/operations/match.md)> | :heavy_check_mark:                                                      | N/A                                                                     |