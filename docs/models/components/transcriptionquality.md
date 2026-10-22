# TranscriptionQuality

Trade-off between transcription speed and accuracy.

## Example Usage

```ruby
require "moderation_api"

value = TranscriptionQuality::SPEED

# Open enum: use .deserialize() to create instances from custom string values
custom = TranscriptionQuality.deserialize("custom_value")
```


## Values

| Name       | Value      |
| ---------- | ---------- |
| `SPEED`    | SPEED      |
| `BALANCED` | BALANCED   |
| `ACCURACY` | ACCURACY   |