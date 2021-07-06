Resource Name: Crew Phone v1
Function: Mumble-voip
Photos: https://i.imgur.com/40m5HGW.png
Edited by: Д̷и̷в̷а̷к̷а™#7777

# EDIT: After testing the phone, everything works. You have to adjust yourself for the photos, you will not help! The phone works without problems, errors, etc. Application for use: yes: 


# screenshot-basic for FiveM

## Usage

2. Install `screenshot-basic`:
   ```
   mkdir -p 'resources/[local]/'
   cd 'resources/[local]'
   git clone https://github.com/citizenfx/screenshot-basic.git screenshot-basic
   ```
3. Make/use a resource that uses it. Currently, there are no directly-usable commands, it is only usable through exports.

## API

### Client

#### requestScreenshot(options?: any, cb: (result: string) => void)
Takes a screenshot and passes the data URI to a callback. Please don't send this through _any_ server events.

Arguments:
* **options**: An optional object containing options.
  * **encoding**: 'png' | 'jpg' | 'webp' - The target image encoding. Defaults to 'jpg'.
  * **quality**: number - The quality for a lossy image encoder, in a range for 0.0-1.0. Defaults to 0.92.
* **cb**: A callback upon result.
  * **result**: A `base64` data URI for the image.

Example:

```lua
exports['screenshot-basic']:requestScreenshot(function(data)
    TriggerEvent('chat:addMessage', { template = '<img src="{0}" style="max-width: 300px;" />', args = { data } })
end)
```

#### requestScreenshotUpload(url: string, field: string, options?: any, cb: (result: string) => void)
Takes a screenshot and uploads it as a file (`multipart/form-data`) to a remote HTTP URL.

Arguments:
* **url**: The URL to a file upload handler.
* **field**: The name for the form field to add the file to.
* **options**: An optional object containing options.
  * **encoding**: 'png' | 'jpg' | 'webp' - The target image encoding. Defaults to 'jpg'.
  * **quality**: number - The quality for a lossy image encoder, in a range for 0.0-1.0. Defaults to 0.92.
* **cb**: A callback upon result.
  * **result**: The response data for the remote URL.

Example:

```lua
exports['screenshot-basic']:requestScreenshotUpload('https://wew.wtf/upload.php', 'files[]', function(data)
    local resp = json.decode(data)
    TriggerEvent('chat:addMessage', { template = '<img src="{0}" style="max-width: 300px;" />', args = { resp.files[1].url } })
end)
```

### Server
The server can also request a client to take a screenshot and upload it to a built-in HTTP handler on the server.

Using this API on the server requires at least FiveM client version 1129160, and server pipeline 1011 or higher.

#### requestClientScreenshot(player: string | number, options: any, cb: (err: string | boolean, data: string) => void)
Requests the specified client to take a screenshot.

Arguments:
* **player**: The target player's player index.
* **options**: An object containing options.
  * **fileName**: string? - The file name on the server to save the image to. If not passed, the callback will get a data URI for the image data.
  * **encoding**: 'png' | 'jpg' | 'webp' - The target image encoding. Defaults to 'jpg'.
  * **quality**: number - The quality for a lossy image encoder, in a range for 0.0-1.0. Defaults to 0.92.
* **cb**: A callback upon result.
  * **err**: `false`, or an error string.
  * **data**: The local file name the upload was saved to, or the data URI for the image.


Example:
```lua
exports['screenshot-basic']:requestClientScreenshot(GetPlayers()[1], {
    fileName = 'cache/screenshot.jpg'
}, function(err, data)
    print('err', err)
    print('data', data)
end)
```

# [Additional Information]
The resource will not be supported, but can be considered for others like it or contact me here [https://discord.gg/xS6A2D5JWG](https://discord.gg/xS6A2D5JWG)

There are more plugins available which you can view at [https://github.com/Creative-Leaks](https://github.com/Creative-Leaks).
