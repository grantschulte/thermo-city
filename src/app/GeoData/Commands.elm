module GeoData.Commands exposing (..)

import GeoData.Decoder exposing (..)
import GeoData.Models exposing (..)
import Geolocation exposing (..)
import Http exposing (..)
import Messages exposing (..)
import Models exposing (..)
import RemoteData exposing (..)
import Utils exposing (..)


fetchGeoData : Model -> Location -> Cmd Msg
fetchGeoData model location =
    Http.get (geoDataUrl model.config location) geoDataDecoder
        |> RemoteData.sendRequest
        |> Cmd.map GeoDataResponse


geoDataUrl : Config -> Location -> String
geoDataUrl config location =
    config.apiUrl ++ "/geoData?" ++ locationQuery location
