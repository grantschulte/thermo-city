module Menu.Models exposing (..)

import Page.Models exposing (..)
import Scale.Models exposing (..)


type alias Menus =
    { tempScale : TempScaleMenu
    , view : ViewMenu
    }


type alias TempScaleMenu =
    { active : Bool
    , selected : Scale
    }


type alias ViewMenu =
    { active : Bool
    , selected : Page
    , options : List ViewMenuItem
    }


type alias ViewMenuItem =
    { name : String
    , page : Page
    }


initTempScaleMenu : TempScaleMenu
initTempScaleMenu =
    { active = False
    , selected = F
    }


viewMenuItems : List ViewMenuItem
viewMenuItems =
    [ { name = "Currently"
      , page = CurrentPage
      }
    , { name = "Hourly"
      , page = HourlyPage
      }
    , { name = "Daily"
      , page = DailyPage
      }
    ]


initViewMenu : ViewMenu
initViewMenu =
    { active = False
    , selected = CurrentPage
    , options = viewMenuItems
    }
