module Alerts.Models exposing (..)

import Time exposing (Time)


type alias Alert =
    { description : String
    , severity : String
    , time : Time
    , title : String
    }
