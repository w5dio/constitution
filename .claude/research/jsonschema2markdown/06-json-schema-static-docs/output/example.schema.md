

# My Amazing Service

<p>This service provisions and manages amazing items in your infrastructure.</p>

<table>
<tbody>


</tbody>
</table>

## Properties

<table class="jssd-properties-table"><thead><tr><th colspan="2">Name</th><th>Type</th></tr></thead><tbody><tr><td colspan="2"><a href="#items">items</a></td><td>Array</td></tr></tbody></table>



<hr />


## items


<table class="jssd-property-table">
  <tbody>
    <tr>
      <th>Description</th>
      <td colspan="2">List of items to provision.</td>
    </tr>
    <tr><th>Type</th><td colspan="2">Array</td></tr>
    <tr>
      <th>Required</th>
      <td colspan="2">Yes</td>
    </tr>
    
  </tbody>
</table>



### items.name


<table class="jssd-property-table">
  <tbody>
    <tr>
      <th>Description</th>
      <td colspan="2">Unique name for the item.</td>
    </tr>
    <tr><th>Type</th><td colspan="2">String</td></tr>
    <tr>
      <th>Examples</th>
      <td colspan="2"><li>alpha</li><li>beta</li></td>
    </tr>
  </tbody>
</table>




### items.mode


<table class="jssd-property-table">
  <tbody>
    <tr>
      <th>Description</th>
      <td colspan="2">Operating mode configuration.</td>
    </tr>
    <tr><th>Type</th><td colspan="2">Object</td></tr>
    
  </tbody>
</table>



### items.mode.strategy


<table class="jssd-property-table">
  <tbody>
    <tr>
      <th>Description</th>
      <td colspan="2">Mode strategy.</td>
    </tr>
    
    <tr>
      <th>Enum</th>
      <td colspan="2"><ul><li>active</li><li>passive</li><li>standby</li></ul></td>
    </tr>
  </tbody>
</table>




### items.mode.settings


<table class="jssd-property-table">
  <tbody>
    <tr>
      <th>Description</th>
      <td colspan="2">Mode-specific settings.</td>
    </tr>
    <tr><th>Type</th><td colspan="2">Object</td></tr>
    
  </tbody>
</table>



### items.mode.settings.timeout


<table class="jssd-property-table">
  <tbody>
    <tr>
      <th>Description</th>
      <td colspan="2">Timeout in seconds.</td>
    </tr>
    <tr><th>Type</th><td colspan="2">Integer</td></tr>
    
  </tbody>
</table>




### items.mode.settings.retries


<table class="jssd-property-table">
  <tbody>
    <tr>
      <th>Description</th>
      <td colspan="2">Number of retries.</td>
    </tr>
    <tr><th>Type</th><td colspan="2">Integer</td></tr>
    
  </tbody>
</table>






### items.count


<table class="jssd-property-table">
  <tbody>
    <tr>
      <th>Description</th>
      <td colspan="2">Number of units to provision. Omit to provision one.</td>
    </tr>
    <tr><th>Type</th><td colspan="2">Integer</td></tr>
    
  </tbody>
</table>




### items.enabled


<table class="jssd-property-table">
  <tbody>
    <tr>
      <th>Description</th>
      <td colspan="2">Whether the item is active. Omit to enable.</td>
    </tr>
    <tr><th>Type</th><td colspan="2">Boolean</td></tr>
    
  </tbody>
</table>










<hr />

## Schema
```
{
    "title": "My Amazing Service",
    "description": "This service provisions and manages amazing items in your infrastructure.",
    "type": "object",
    "required": [
        "items"
    ],
    "additionalProperties": false,
    "properties": {
        "items": {
            "description": "List of items to provision.",
            "type": "array",
            "items": {
                "type": "object",
                "required": [
                    "name",
                    "mode"
                ],
                "additionalProperties": false,
                "properties": {
                    "name": {
                        "description": "Unique name for the item.",
                        "type": "string",
                        "examples": [
                            "alpha",
                            "beta"
                        ]
                    },
                    "mode": {
                        "description": "Operating mode configuration.",
                        "type": "object",
                        "required": [
                            "strategy"
                        ],
                        "additionalProperties": false,
                        "properties": {
                            "strategy": {
                                "description": "Mode strategy.",
                                "enum": [
                                    "active",
                                    "passive",
                                    "standby"
                                ]
                            },
                            "settings": {
                                "description": "Mode-specific settings.",
                                "type": "object",
                                "required": [],
                                "additionalProperties": false,
                                "properties": {
                                    "timeout": {
                                        "description": "Timeout in seconds.",
                                        "type": "integer"
                                    },
                                    "retries": {
                                        "description": "Number of retries.",
                                        "type": "integer"
                                    }
                                }
                            }
                        }
                    },
                    "count": {
                        "description": "Number of units to provision. Omit to provision one.",
                        "type": "integer"
                    },
                    "enabled": {
                        "description": "Whether the item is active. Omit to enable.",
                        "type": "boolean"
                    }
                }
            }
        }
    }
}
```


