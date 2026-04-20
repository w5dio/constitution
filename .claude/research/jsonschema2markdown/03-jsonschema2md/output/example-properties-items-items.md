# Untitled object in My Amazing Service Schema

```txt
undefined#/properties/items/items
```



| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                                    |
| :------------------ | :--------- | :------------- | :----------- | :---------------- | :-------------------- | :------------------ | :---------------------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Forbidden             | none                | [example.schema.json\*](../schema/example.schema.json "open original schema") |

## items Type

`object` ([Details](example-properties-items-items.md))

# items Properties

| Property            | Type      | Required | Nullable       | Defined by                                                                                                                        |
| :------------------ | :-------- | :------- | :------------- | :-------------------------------------------------------------------------------------------------------------------------------- |
| [name](#name)       | `string`  | Required | cannot be null | [My Amazing Service](example-properties-items-items-properties-name.md "undefined#/properties/items/items/properties/name")       |
| [mode](#mode)       | `object`  | Required | cannot be null | [My Amazing Service](example-properties-items-items-properties-mode.md "undefined#/properties/items/items/properties/mode")       |
| [count](#count)     | `integer` | Optional | cannot be null | [My Amazing Service](example-properties-items-items-properties-count.md "undefined#/properties/items/items/properties/count")     |
| [enabled](#enabled) | `boolean` | Optional | cannot be null | [My Amazing Service](example-properties-items-items-properties-enabled.md "undefined#/properties/items/items/properties/enabled") |

## name

Unique name for the item.

`name`

* is required

* Type: `string`

* cannot be null

* defined in: [My Amazing Service](example-properties-items-items-properties-name.md "undefined#/properties/items/items/properties/name")

### name Type

`string`

### name Examples

```json
"alpha"
```

```json
"beta"
```

## mode

Operating mode configuration.

`mode`

* is required

* Type: `object` ([Details](example-properties-items-items-properties-mode.md))

* cannot be null

* defined in: [My Amazing Service](example-properties-items-items-properties-mode.md "undefined#/properties/items/items/properties/mode")

### mode Type

`object` ([Details](example-properties-items-items-properties-mode.md))

## count

Number of units to provision. Omit to provision one.

`count`

* is optional

* Type: `integer`

* cannot be null

* defined in: [My Amazing Service](example-properties-items-items-properties-count.md "undefined#/properties/items/items/properties/count")

### count Type

`integer`

## enabled

Whether the item is active. Omit to enable.

`enabled`

* is optional

* Type: `boolean`

* cannot be null

* defined in: [My Amazing Service](example-properties-items-items-properties-enabled.md "undefined#/properties/items/items/properties/enabled")

### enabled Type

`boolean`
