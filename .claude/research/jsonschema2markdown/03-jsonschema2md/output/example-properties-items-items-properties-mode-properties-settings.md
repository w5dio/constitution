# Untitled object in My Amazing Service Schema

```txt
undefined#/properties/items/items/properties/mode/properties/settings
```

Mode-specific settings.

| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                                    |
| :------------------ | :--------- | :------------- | :----------- | :---------------- | :-------------------- | :------------------ | :---------------------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Forbidden             | none                | [example.schema.json\*](../schema/example.schema.json "open original schema") |

## settings Type

`object` ([Details](example-properties-items-items-properties-mode-properties-settings.md))

# settings Properties

| Property            | Type      | Required | Nullable       | Defined by                                                                                                                                                                                                |
| :------------------ | :-------- | :------- | :------------- | :-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [timeout](#timeout) | `integer` | Optional | cannot be null | [My Amazing Service](example-properties-items-items-properties-mode-properties-settings-properties-timeout.md "undefined#/properties/items/items/properties/mode/properties/settings/properties/timeout") |
| [retries](#retries) | `integer` | Optional | cannot be null | [My Amazing Service](example-properties-items-items-properties-mode-properties-settings-properties-retries.md "undefined#/properties/items/items/properties/mode/properties/settings/properties/retries") |

## timeout

Timeout in seconds.

`timeout`

* is optional

* Type: `integer`

* cannot be null

* defined in: [My Amazing Service](example-properties-items-items-properties-mode-properties-settings-properties-timeout.md "undefined#/properties/items/items/properties/mode/properties/settings/properties/timeout")

### timeout Type

`integer`

## retries

Number of retries.

`retries`

* is optional

* Type: `integer`

* cannot be null

* defined in: [My Amazing Service](example-properties-items-items-properties-mode-properties-settings-properties-retries.md "undefined#/properties/items/items/properties/mode/properties/settings/properties/retries")

### retries Type

`integer`
