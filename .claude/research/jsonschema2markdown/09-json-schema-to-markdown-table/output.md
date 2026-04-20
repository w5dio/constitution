Name | Type | Description
---- | ---- | -----------
items | array | List of items to provision.
items[] | object | 
*items[].* name | string | Unique name for the item.
*items[].* mode | object | Operating mode configuration.
*items[].mode.* strategy | string | Mode strategy.
*items[].mode.* settings | object | *Optional* Mode-specific settings.
*items[].mode.settings.* retries | integer | *Optional* Number of retries.
*items[].mode.settings.* timeout | integer | *Optional* Timeout in seconds.
*items[].* count | integer | *Optional* Number of units to provision. Omit to provision one.
*items[].* enabled | boolean | *Optional* Whether the item is active. Omit to enable.
