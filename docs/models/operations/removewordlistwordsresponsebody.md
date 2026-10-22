# RemoveWordlistWordsResponseBody

Words successfully removed from wordlist


## Fields

| Field                             | Type                              | Required                          | Description                       |
| --------------------------------- | --------------------------------- | --------------------------------- | --------------------------------- |
| `removed_count`                   | *::Float*                         | :heavy_check_mark:                | Number of words removed           |
| `total_count`                     | *::Float*                         | :heavy_check_mark:                | Total number of words in wordlist |
| `removed_words`                   | T::Array<*::String*>              | :heavy_check_mark:                | List of words removed             |