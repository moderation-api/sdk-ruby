# GetAnalyticsChannelsResponseBody

Successful response


## Fields

| Field                                                                                                                 | Type                                                                                                                  | Required                                                                                                              | Description                                                                                                           |
| --------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------- |
| `range`                                                                                                               | [Models::Operations::GetAnalyticsChannelsRangeResponse](../../models/operations/getanalyticschannelsrangeresponse.md) | :heavy_check_mark:                                                                                                    | The time window of the numbers.                                                                                       |
| `channels`                                                                                                            | T::Array<[Models::Operations::Channel](../../models/operations/channel.md)>                                           | :heavy_check_mark:                                                                                                    | Requests and flags per channel. Channels with no requests in the window are not included.                             |