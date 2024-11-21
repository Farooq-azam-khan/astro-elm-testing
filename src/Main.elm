module Main exposing (main)

import Browser
import Html exposing (..)


type alias Model =
    { counter : Int }


type Msg
    = NoOp


update : Msg -> Model -> Model
update msg model =
    case msg of
        NoOp ->
            model


view : Model -> Html msg
view model =
    div []
        [ h1 [] [ text "Below is elm code" ]
        , text <| String.fromInt model.counter
        ]


main : Program () Model Msg
main =
    Browser.sandbox
        { init = { counter = 0 }
        , view = view
        , update = update
        }
