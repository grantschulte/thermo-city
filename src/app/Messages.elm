module Messages exposing (..)

import Daily.Models exposing (..)
import GeoData.Models exposing (..)
import Geolocation exposing (..)
import Http exposing (..)
import Models exposing (..)
import RemoteData exposing (..)


-- MESSAGES


type Msg
    = SetPage Page
    | FetchGeoData (Result Http.Error GeoData)
    | FetchLocation (Result Geolocation.Error Location)
    | DailyWeatherResponse (WebData (List DailyWeather))
