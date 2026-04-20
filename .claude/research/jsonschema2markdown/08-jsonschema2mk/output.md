# My Amazing Service

This service provisions and manages amazing items in your infrastructure.


**Properties**

|Name|Type|Description|Required|
|----|----|-----------|--------|
|[**items**](#items)|`object[]`|List of items to provision.<br/>|yes|

**Additional Properties:** not allowed  
**Example**

```json
{
    "items": [
        {
            "name": "alpha",
            "mode": {
                "settings": {}
            }
        }
    ]
}
```

<a name="items"></a>
## items\[\]: array

List of items to provision.


**Items**

**Item Properties**

|Name|Type|Description|Required|
|----|----|-----------|--------|
|**name**|`string`|Unique name for the item.<br/>|yes|
|[**mode**](#itemsmode)|`object`|Operating mode configuration.<br/>|yes|
|**count**|`integer`|Number of units to provision. Omit to provision one.<br/>|no|
|**enabled**|`boolean`|Whether the item is active. Omit to enable.<br/>|no|

**Item Additional Properties:** not allowed  
**Example**

```json
[
    {
        "name": "alpha",
        "mode": {
            "settings": {}
        }
    }
]
```

<a name="itemsmode"></a>
### items\[\]\.mode: object

Operating mode configuration.


**Properties**

|Name|Type|Description|Required|
|----|----|-----------|--------|
|**strategy**||Mode strategy.<br/>Enum: `"active"`, `"passive"`, `"standby"`<br/>|yes|
|[**settings**](#itemsmodesettings)|`object`|Mode-specific settings.<br/>|no|

**Additional Properties:** not allowed  
**Example**

```json
{
    "settings": {}
}
```

<a name="itemsmodesettings"></a>
#### items\[\]\.mode\.settings: object

Mode-specific settings.


**Properties**

|Name|Type|Description|Required|
|----|----|-----------|--------|
|**timeout**|`integer`|Timeout in seconds.<br/>|no|
|**retries**|`integer`|Number of retries.<br/>|no|

**Additional Properties:** not allowed  

