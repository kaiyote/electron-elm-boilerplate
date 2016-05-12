module Main exposing (..)

import Html exposing (Html, div, text, ul, li, button)
import Html.App as Html exposing (map)
import Html.Events exposing (onClick)
import Maybe exposing (Maybe)
import Counter
import Nested.Main exposing (swap, callJSLog)

import Debug exposing (log)

type Msg
  = Swap (Maybe Bool)
  | CounterMsg Counter.Msg
  | AppendLog String


main =
  Html.program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }


-- MODEL


type alias Model =
  { counter : Counter.Model
  , logs : List String
  }


init : (Model, Cmd Msg)
init =
  ({ counter = Counter.init, logs = [] }, Cmd.none)


-- UPDATE


update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case log "msg" msg of
    Swap _ ->
      (model, Cmd.none)

    CounterMsg counterMsg ->
      let
        (counterModel, _) = Counter.update counterMsg model.counter
      in
        ({ model | counter = counterModel}, Cmd.none)

    AppendLog log ->
      ({ model | logs = log :: model.logs }, callJSLog log)


-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
  swap Swap


-- VIEW


view : Model -> Html Msg
view model =
  div []
    [ text "counter (Elm.Main):"
    , map CounterMsg (Counter.view model.counter)
    , text "logs:"
    , button [ onClick (AppendLog (getLog model)) ] [ text "append log" ]
    , ul [] (List.map (\log -> li [] [ text log ]) model.logs)
    ]


getLog : Model -> String
getLog model =
  ("Count = " ++ (toString model.counter))
