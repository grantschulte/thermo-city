module GeoData.Decoder exposing (..)

import GeoData.Models exposing (..)
import Json.Decode as Decode
import Json.Decode.Pipeline exposing (decode, required)


geoDataDecoder : Decode.Decoder GeoData
geoDataDecoder =
    decode GeoData
        |> required "address" Decode.string
