<a name="#resource-item"></a>
## Item


An item to provision.


### Attributes

<details>
  <summary>Details</summary>


| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **count** | *integer* | Number of units to provision. Omit to provision one. | `1` |
| **enabled** | *boolean* | Whether the item is active. Omit to enable. | `true` |
| **mode_settings_retries** | *integer* | Number of retries. | `3` |
| **mode_settings_timeout** | *integer* | Timeout in seconds. | `30` |
| **mode_strategy** | *string* | Mode strategy. | `"active"` |
| **name** | *string* | Unique name for the item. | `"alpha"` |

</details>

<a name="link-GET-item-/items"></a>
### Item List

<details>
  <summary>Details</summary>

List all items.

```
GET /items
```


#### Curl Example

```bash
$ curl -n https://api.example.com/items
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
[
  {
    "name": "alpha",
    "mode_strategy": "active",
    "mode_settings_timeout": 30,
    "mode_settings_retries": 3,
    "count": 1,
    "enabled": true
  }
]
```

</details>


