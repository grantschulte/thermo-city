module Models exposing (..)

-- MODEL


type alias ApiUrl =
    String


type alias NodeEnv =
    String


type alias Greeting =
    String


type alias Model =
    { greeting : Greeting
    , apiUrl : ApiUrl
    , nodeEnv : NodeEnv
    }


type alias Flags =
    { apiUrl : ApiUrl
    , nodeEnv : NodeEnv
    }
