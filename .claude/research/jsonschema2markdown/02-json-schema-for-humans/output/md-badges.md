# My Amazing Service

- [1. ![Required](https://img.shields.io/badge/Required-blue) Property `My Amazing Service > items`](#items)
  - [1.1. My Amazing Service > items > items items](#items_items)
    - [1.1.1. Property `My Amazing Service > items > items items > name`](#items_items_name)
    - [1.1.2. Property `My Amazing Service > items > items items > mode`](#items_items_mode)
      - [1.1.2.1. Property `My Amazing Service > items > items items > mode > strategy`](#items_items_mode_strategy)
      - [1.1.2.2. Property `My Amazing Service > items > items items > mode > settings`](#items_items_mode_settings)
        - [1.1.2.2.1. Property `My Amazing Service > items > items items > mode > settings > timeout`](#items_items_mode_settings_timeout)
        - [1.1.2.2.2. Property `My Amazing Service > items > items items > mode > settings > retries`](#items_items_mode_settings_retries)
    - [1.1.3. Property `My Amazing Service > items > items items > count`](#items_items_count)
    - [1.1.4. Property `My Amazing Service > items > items items > enabled`](#items_items_enabled)

**Title:** My Amazing Service

|                           |                                                                |
| ------------------------- | -------------------------------------------------------------- |
| **Type**                  | `object`                                                       |
| **Additional properties** | ![Not allowed](https://img.shields.io/badge/Not%20allowed-red) |

**Description:** This service provisions and manages amazing items in your infrastructure.

| Property           | Pattern | Type            | Deprecated | Definition | Title/Description           |
| ------------------ | ------- | --------------- | ---------- | ---------- | --------------------------- |
| + [items](#items ) | No      | array of object | No         | -          | List of items to provision. |

## <a name="items"></a>1. ![Required](https://img.shields.io/badge/Required-blue) Property `My Amazing Service > items`

|          |                   |
| -------- | ----------------- |
| **Type** | `array of object` |

**Description:** List of items to provision.

|                      | Array restrictions |
| -------------------- | ------------------ |
| **Min items**        | N/A                |
| **Max items**        | N/A                |
| **Items unicity**    | False              |
| **Additional items** | False              |
| **Tuple validation** | See below          |

| Each item of this array must be | Description |
| ------------------------------- | ----------- |
| [items items](#items_items)     | -           |

### <a name="items_items"></a>1.1. My Amazing Service > items > items items

|                           |                                                                |
| ------------------------- | -------------------------------------------------------------- |
| **Type**                  | `object`                                                       |
| **Additional properties** | ![Not allowed](https://img.shields.io/badge/Not%20allowed-red) |

| Property                           | Pattern | Type    | Deprecated | Definition | Title/Description                                    |
| ---------------------------------- | ------- | ------- | ---------- | ---------- | ---------------------------------------------------- |
| + [name](#items_items_name )       | No      | string  | No         | -          | Unique name for the item.                            |
| + [mode](#items_items_mode )       | No      | object  | No         | -          | Operating mode configuration.                        |
| - [count](#items_items_count )     | No      | integer | No         | -          | Number of units to provision. Omit to provision one. |
| - [enabled](#items_items_enabled ) | No      | boolean | No         | -          | Whether the item is active. Omit to enable.          |

#### <a name="items_items_name"></a>1.1.1. Property `My Amazing Service > items > items items > name`

|          |          |
| -------- | -------- |
| **Type** | `string` |

**Description:** Unique name for the item.

**Examples:**

```json
"alpha"
```

```json
"beta"
```

#### <a name="items_items_mode"></a>1.1.2. Property `My Amazing Service > items > items items > mode`

|                           |                                                                |
| ------------------------- | -------------------------------------------------------------- |
| **Type**                  | `object`                                                       |
| **Additional properties** | ![Not allowed](https://img.shields.io/badge/Not%20allowed-red) |

**Description:** Operating mode configuration.

| Property                                  | Pattern | Type             | Deprecated | Definition | Title/Description       |
| ----------------------------------------- | ------- | ---------------- | ---------- | ---------- | ----------------------- |
| + [strategy](#items_items_mode_strategy ) | No      | enum (of string) | No         | -          | Mode strategy.          |
| - [settings](#items_items_mode_settings ) | No      | object           | No         | -          | Mode-specific settings. |

##### <a name="items_items_mode_strategy"></a>1.1.2.1. Property `My Amazing Service > items > items items > mode > strategy`

|          |                    |
| -------- | ------------------ |
| **Type** | `enum (of string)` |

**Description:** Mode strategy.

Must be one of:
* "active"
* "passive"
* "standby"

##### <a name="items_items_mode_settings"></a>1.1.2.2. Property `My Amazing Service > items > items items > mode > settings`

|                           |                                                                |
| ------------------------- | -------------------------------------------------------------- |
| **Type**                  | `object`                                                       |
| **Additional properties** | ![Not allowed](https://img.shields.io/badge/Not%20allowed-red) |

**Description:** Mode-specific settings.

| Property                                         | Pattern | Type    | Deprecated | Definition | Title/Description   |
| ------------------------------------------------ | ------- | ------- | ---------- | ---------- | ------------------- |
| - [timeout](#items_items_mode_settings_timeout ) | No      | integer | No         | -          | Timeout in seconds. |
| - [retries](#items_items_mode_settings_retries ) | No      | integer | No         | -          | Number of retries.  |

###### <a name="items_items_mode_settings_timeout"></a>1.1.2.2.1. Property `My Amazing Service > items > items items > mode > settings > timeout`

|          |           |
| -------- | --------- |
| **Type** | `integer` |

**Description:** Timeout in seconds.

###### <a name="items_items_mode_settings_retries"></a>1.1.2.2.2. Property `My Amazing Service > items > items items > mode > settings > retries`

|          |           |
| -------- | --------- |
| **Type** | `integer` |

**Description:** Number of retries.

#### <a name="items_items_count"></a>1.1.3. Property `My Amazing Service > items > items items > count`

|          |           |
| -------- | --------- |
| **Type** | `integer` |

**Description:** Number of units to provision. Omit to provision one.

#### <a name="items_items_enabled"></a>1.1.4. Property `My Amazing Service > items > items items > enabled`

|          |           |
| -------- | --------- |
| **Type** | `boolean` |

**Description:** Whether the item is active. Omit to enable.

----------------------------------------------------------------------------------------------------------------------------
Generated using [json-schema-for-humans](https://github.com/coveooss/json-schema-for-humans) on 2026-04-20 at 19:51:55 +0800
