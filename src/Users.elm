module Users exposing (main)

import Browser
import Html exposing (..)


type alias User =
    { username : String, email : String }


type alias UsersPage =
    { users : List User }


type Msg
    = NoOp


update : Msg -> UsersPage -> ( UsersPage, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )


view : UsersPage -> Html msg
view model =
    div []
        [ h1 [] [ text "Below is a list of users" ]
        , model.users |> List.map (\u -> li [] [ text u.username ]) |> ol []
        ]


type alias Flags =
    { users : List User }


init : Flags -> ( UsersPage, Cmd Msg )
init flags =
    ( { users = flags.users }, Cmd.none )


main : Program Flags UsersPage Msg
main =
    Browser.element
        { init = init
        , subscriptions = \_ -> Sub.none
        , view = view
        , update = update
        }
