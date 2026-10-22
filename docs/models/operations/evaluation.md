# Evaluation

The evaluation of the content after running the channel policies.


## Fields

| Field                                                                               | Type                                                                                | Required                                                                            | Description                                                                         |
| ----------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------- |
| `flagged`                                                                           | *T::Boolean*                                                                        | :heavy_check_mark:                                                                  | Whether the content was flagged by any policy.                                      |
| `flag_probability`                                                                  | *::Float*                                                                           | :heavy_check_mark:                                                                  | The probability that the content should be flagged.                                 |
| `severity_score`                                                                    | *::Float*                                                                           | :heavy_check_mark:                                                                  | The severity score of the content. A higher score indicates more severe content.    |
| `unicode_spoofed`                                                                   | *T.nilable(T::Boolean)*                                                             | :heavy_minus_sign:                                                                  | Whether the content was flagged for Unicode spoofing.                               |
| `shadow_flagged`                                                                    | *T.nilable(T::Boolean)*                                                             | :heavy_minus_sign:                                                                  | Whether the content would have been flagged by analyze-only policies (flag: false). |