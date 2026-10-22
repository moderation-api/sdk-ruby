# CreateAuthorMetadata

Additional metadata provided by your system. We recommend including any relevant information that may assist in the moderation process.


## Fields

| Field                                         | Type                                          | Required                                      | Description                                   |
| --------------------------------------------- | --------------------------------------------- | --------------------------------------------- | --------------------------------------------- |
| `email_verified`                              | *T.nilable(T::Boolean)*                       | :heavy_minus_sign:                            | Whether the author's email is verified        |
| `phone_verified`                              | *T.nilable(T::Boolean)*                       | :heavy_minus_sign:                            | Whether the author's phone number is verified |
| `identity_verified`                           | *T.nilable(T::Boolean)*                       | :heavy_minus_sign:                            | Whether the author's identity is verified     |
| `is_paying_customer`                          | *T.nilable(T::Boolean)*                       | :heavy_minus_sign:                            | Whether the author is a paying customer       |
| `additional_properties`                       | T::Hash[Symbol, *::Object*]                   | :heavy_minus_sign:                            | N/A                                           |