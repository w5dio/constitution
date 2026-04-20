# My Amazing Service Schema

```txt
undefined
```

This service provisions and manages amazing items in your infrastructure.

| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                                  |
| :------------------ | :--------- | :------------- | :----------- | :---------------- | :-------------------- | :------------------ | :-------------------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Forbidden             | none                | [example.schema.json](../schema/example.schema.json "open original schema") |

## My Amazing Service Type

`object` ([My Amazing Service](example.md))

# My Amazing Service Properties

| Property        | Type    | Required | Nullable       | Defined by                                                                      |
| :-------------- | :------ | :------- | :------------- | :------------------------------------------------------------------------------ |
| [items](#items) | `array` | Required | cannot be null | [My Amazing Service](example-properties-items.md "undefined#/properties/items") |

## items

List of items to provision.

`items`

* is required

* Type: `object[]` ([Details](example-properties-items-items.md))

* cannot be null

* defined in: [My Amazing Service](example-properties-items.md "undefined#/properties/items")

### items Type

`object[]` ([Details](example-properties-items-items.md))
