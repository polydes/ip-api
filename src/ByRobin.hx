package;

import openfl.errors.Error;

class ByRobin
{

    private static var _jsonIsRequested:Bool = false;
    private static var _hasInternetConnection:Bool = false;

    private static var _CITY:String = "";
    private static var _COUNTRY:String = "";
    private static var _COUNTRYCODE:String = "";
    private static var _ISP:String = "";
    private static var _LATITUDE:String = "";
    private static var _LONGITUDE:String = "";
    private static var _ORGANISATION:String = "";
    private static var _IPADRESS:String = "";
    private static var _REGION:String = "";
    private static var _REGIONNAME:String = "";
    private static var _TIMEZONE:String = "";
    private static var _ZIPCODE:String = "";
    private static var _CONTINENT:String = "";



	  private static function requestJson()
    {
      trace("JsonRequest");
      if(!_jsonIsRequested)
      {
        _jsonIsRequested = true;
        try {
          var http = new haxe.Http("http://ip-api.com/json");

          trace(http);

          http.onData = function (data:String)
          {

            var result = haxe.Json.parse(data);
            trace(result.status);

            if(result.status == "success")
            {
              _jsonIsRequested = true;

              _CITY = result.city;
              _COUNTRY = result.country;
              _COUNTRYCODE = result.countryCode;
              _ISP = result.isp;
              _LATITUDE = result.lat;
              _LONGITUDE = result.lon;
              _ORGANISATION = result.org;
              _IPADRESS = result.query;
              _REGION = result.region;
              _REGIONNAME = result.regionName;
              _TIMEZONE = result.timezone;
              _ZIPCODE = result.zip;

              var _continentArray = new Array<Dynamic>();
              _continentArray = _TIMEZONE.split("/");
              _CONTINENT = _continentArray[0];

              trace("City: " + _CITY);
              trace("Country: " + _COUNTRY);
              trace("Timezone: " + _TIMEZONE);
              trace("Continent: " + _CONTINENT);

            }

          };

          http.onError = function (msg:String)
          {
            _hasInternetConnection = false;
            trace("HTTP Request Error: " + msg);
          };

          http.onStatus = function (status:Int)
          {
            _hasInternetConnection = true;
            trace("HTTP Request Status: " + status);
          };

          http.request();

        } catch (e:Error) {
          trace(e);
        }

      }

    }


    public static function getCity():String
    {
      if(!_jsonIsRequested)
      {
        requestJson();
      }

      return _CITY;
    }

    public static function getCountry():String
    {
      if(!_jsonIsRequested)
      {
        requestJson();
      }

      return _COUNTRY;
    }

    public static function getCountryCode():String
    {
      if(!_jsonIsRequested)
      {
        requestJson();
      }

      return _COUNTRYCODE;
    }

    public static function getISP():String
    {
      if(!_jsonIsRequested)
      {
        requestJson();
      }

      return _ISP;
    }

    public static function getLatitude():String
    {
      if(!_jsonIsRequested)
      {
        requestJson();
      }

      return _LATITUDE;
    }

    public static function getLongitude():String
    {
      if(!_jsonIsRequested)
      {
        requestJson();
      }

      return _LONGITUDE;
    }

    public static function getOrganisation():String
    {
      if(!_jsonIsRequested)
      {
        requestJson();
      }

      return _ORGANISATION;
    }

    public static function getIpAdress():String
    {
      if(!_jsonIsRequested)
      {
        requestJson();
      }

      return _IPADRESS;
    }

    public static function getRegion():String
    {
      if(!_jsonIsRequested)
      {
        requestJson();
      }

      return _REGION;
    }

    public static function getRegionName():String
    {
      if(!_jsonIsRequested)
      {
        requestJson();
      }

      return _REGIONNAME;
    }

    public static function getZipCode():String
    {
      if(!_jsonIsRequested)
      {
        requestJson();
      }

      return _ZIPCODE;
    }

    public static function getContinent():String
    {
      if(!_jsonIsRequested)
      {
        requestJson();
      }

      return _CONTINENT;
    }

    public static function isInContinent(continent:String):Bool
    {
      if(!_jsonIsRequested)
      {
        requestJson();
      }

      if(continent == _CONTINENT)
      {
        return true;
      }

      return false;
    }

    public static function hasInternetConnection():Bool
    {
      if(!_jsonIsRequested)
      {
        requestJson();
      }

      if(_hasInternetConnection)
      {
        return true;
      }

      return false;
    }
}
