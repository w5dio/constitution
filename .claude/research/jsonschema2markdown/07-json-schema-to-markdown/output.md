# My Amazing Service

This service provisions and manages amazing items in your infrastructure.

The schema defines the following properties:

## `items` (array, required)

List of items to provision.

The object is an array with all elements of the type `object`.

The array object has the following properties:

### `name` (string, required)

Unique name for the item.

### `mode` (object, required)

Operating mode configuration.

Properties of the `mode` object:

#### `strategy` (, enum, required)

Mode strategy.

This element must be one of the following enum values:

* `active`
* `passive`
* `standby`

#### `settings` (object)

Mode-specific settings.

Properties of the `settings` object:

##### `timeout` (integer)

Timeout in seconds.

##### `retries` (integer)

Number of retries.

### `count` (integer)

Number of units to provision. Omit to provision one.

### `enabled` (boolean)

Whether the item is active. Omit to enable.
