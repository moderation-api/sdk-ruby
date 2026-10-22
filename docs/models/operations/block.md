# Block


## Fields

| Field                                                                  | Type                                                                   | Required                                                               | Description                                                            |
| ---------------------------------------------------------------------- | ---------------------------------------------------------------------- | ---------------------------------------------------------------------- | ---------------------------------------------------------------------- |
| `until_`                                                               | *T.nilable(::Float)*                                                   | :heavy_minus_sign:                                                     | The timestamp until which they are blocked if the author is suspended. |
| `reason`                                                               | *T.nilable(::String)*                                                  | :heavy_minus_sign:                                                     | The moderators reason why the author was blocked or suspended.         |