# My Amazing Service

This service provisions and manages amazing items in your infrastructure.

### Type: `object`

> ⚠️ Additional properties are not allowed.

| Property | Type | Required | Possible values | Deprecated | Default | Description | Examples |
| -------- | ---- | -------- | --------------- | ---------- | ------- | ----------- | -------- |
| items | `array` | ✅ | object |  |  | List of items to provision. |  |
| items[].name | `string` | ✅ | string |  |  | Unique name for the item. | ```alpha```, ```beta``` |
| items[].mode | `object` | ✅ | object |  |  | Operating mode configuration. |  |
| items[].mode.strategy | `None` | ✅ | `active` `passive` `standby` |  |  | Mode strategy. |  |
| items[].mode.settings | `object` |  | object |  |  | Mode-specific settings. |  |
| items[].mode.settings.timeout | `integer` |  | integer |  |  | Timeout in seconds. |  |
| items[].mode.settings.retries | `integer` |  | integer |  |  | Number of retries. |  |
| items[].count | `integer` |  | integer |  |  | Number of units to provision. Omit to provision one. |  |
| items[].enabled | `boolean` |  | boolean |  |  | Whether the item is active. Omit to enable. |  |


---

Markdown generated with [jsonschema-markdown](https://github.com/elisiariocouto/jsonschema-markdown).
