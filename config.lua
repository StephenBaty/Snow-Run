
settings =
{
  android =
  {
    versionCode = "1.0"
  },

  androidPermissions =
  {
      "android.permission.INTERNET",
      "android.permission.ACCESS_WIFI_STATE",
      "android.permission.READ_PHONE_STATE",
      "android.permission.ACCESS_NETWORK_STATE",

  },
  iphone =
  {
    plist =
    {
      UIRequiredDeviceCapabilities = "gyroscope"

    },
  },
  orientation =
  {
    default ="landscapeRight",
    supported =
    {
      "landscapeLeft", "landscapeRight",
    },
  },


  --  move the ad network outside the commented section to use it
    plugins =
    {
        -- key is the name passed to Lua's 'require()'
        -- admob
        ["CoronaProvider.ads.admob"] =
        {
            -- required
            publisherId = "com.coronalabs",
        },
        --[[-- key is the name passed to Lua's 'require()'
        --inmobi
        ["CoronaProvider.ads.inmobi"] =
        {
            -- required
            publisherId = "com.coronalabs",
        },

        -- No plugin required for revmob

        -- key is the name passed to Lua's 'require()'
        -- iAds (Apple)
        ["CoronaProvider.ads.iads"] =
        {
            -- required
            publisherId = "com.coronalabs",
        },]]

    },    


  build =
  {
    custom = "1.0",
  }
}


application = {
   content = {
 --     width = aspectRatio > 1.5 and 800 or math.ceil( 1200 / aspectRatio ),
  --    height = aspectRatio < 1.5 and 1200 or math.ceil( 800 * aspectRatio ),
	  width = 480,
	  height = 600,
      scale = "letterBox",
      fps = 30,

      imageSuffix = {
         ["@2x"] = 2,
      },
   },
}