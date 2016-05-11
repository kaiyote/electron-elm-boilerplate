port module Ports exposing (swap, Msg(Swap))

import Maybe exposing (Maybe)


type Msg
  = Swap (Maybe String)


port swap : (Maybe String -> msg) -> Sub msg
