# GetWordlistEmbeddingStatusResponseBody

Embedding status details


## Fields

| Field                                               | Type                                                | Required                                            | Description                                         |
| --------------------------------------------------- | --------------------------------------------------- | --------------------------------------------------- | --------------------------------------------------- |
| `progress`                                          | *::Float*                                           | :heavy_check_mark:                                  | Percentage of words that have been embedded (0-100) |
| `total_words`                                       | *::Float*                                           | :heavy_check_mark:                                  | Total number of words in the wordlist               |
| `remaining_words`                                   | *::Float*                                           | :heavy_check_mark:                                  | Number of words still waiting to be embedded        |