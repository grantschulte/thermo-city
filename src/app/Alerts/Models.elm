module Alerts.Models exposing (..)

import Time exposing (Time)


type alias Alert =
    { description : String
    , regions : List String
    , severity : String
    , time : Time
    , title : String
    }
