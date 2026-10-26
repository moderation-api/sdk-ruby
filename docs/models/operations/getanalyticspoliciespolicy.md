# GetAnalyticsPoliciesPolicy


## Fields

| Field                                                                    | Type                                                                     | Required                                                                 | Description                                                              |
| ------------------------------------------------------------------------ | ------------------------------------------------------------------------ | ------------------------------------------------------------------------ | ------------------------------------------------------------------------ |
| `label`                                                                  | *::String*                                                               | :heavy_check_mark:                                                       | The policy label, for example `toxicity`.                                |
| `flagged`                                                                | *::Integer*                                                              | :heavy_check_mark:                                                       | Flagged requests with this label in the window. Repeats count each time. |
| `previous_flagged`                                                       | *::Integer*                                                              | :heavy_check_mark:                                                       | Flagged requests with this label in the window of equal length before.   |