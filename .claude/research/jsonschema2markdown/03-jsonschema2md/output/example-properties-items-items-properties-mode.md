# Untitled object in My Amazing Service Schema

```txt
undefined#/properties/items/items/properties/mode
```

Operating mode configuration.

| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                                    |
| :------------------ | :--------- | :------------- | :----------- | :---------------- | :-------------------- | :------------------ | :---------------------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Forbidden             | none                | [example.schema.json\*](../schema/example.schema.json "open original schema") |

## mode Type

`object` ([Details](example-properties-items-items-properties-mode.md))

# mode Properties

| Property              | Type          | Required | Nullable       | Defined by                                                                                                                                                          |
| :-------------------- | :------------ | :------- | :------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| [strategy](#strategy) | Not specified | Required | cannot be null | [My Amazing Service](example-properties-items-items-properties-mode-properties-strategy.md "undefined#/properties/items/items/properties/mode/properties/strategy") |
| [settings](#settings) | `object`      | Optional | cannot be null | [My Amazing Service](example-properties-items-items-properties-mode-properties-settings.md "undefined#/properties/items/items/properties/mode/properties/settings") |

## strategy

Mode strategy.

`strategy`

* is required

* Type: unknown

* cannot be null

* defined in: [My Amazing Service](example-properties-items-items-properties-mode-properties-strategy.md "undefined#/properties/items/items/properties/mode/properties/strategy")

### strategy Type

unknown

### strategy Constraints

**enum**: the value of this property must be equal to one of the following values:

| Value       | Explanation |
| :---------- | :---------- |
| `"active"`  |             |
| `"passive"` |             |
| `"standby"` |             |

## settings

Mode-specific settings.

`settings`

* is optional

* Type: `object` ([Details](example-properties-items-items-properties-mode-properties-settings.md))

* cannot be null

* defined in: [My Amazing Service](example-properties-items-items-properties-mode-properties-settings.md "undefined#/properties/items/items/properties/mode/properties/settings")

### settings Type

`object` ([Details](example-properties-items-items-properties-mode-properties-settings.md))
