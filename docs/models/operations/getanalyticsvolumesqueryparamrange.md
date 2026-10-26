# GetAnalyticsVolumesQueryParamRange

The time window. `24h` is the last 24 hours, in hourly buckets. `7d`, `30d` and `90d` are whole UTC days that end with today, in daily buckets.

## Example Usage

```ruby
require "moderation_api"

value = GetAnalyticsVolumesQueryParamRange::TWENTY_FOURH
```


## Values

| Name           | Value          |
| -------------- | -------------- |
| `TWENTY_FOURH` | 24h            |
| `SEVEND`       | 7d             |
| `THIRTYD`      | 30d            |
| `NINETYD`      | 90d            |