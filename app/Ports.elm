port module Ports exposing (path, pushPath, swap)


port path : (String -> msg) -> Sub msg


port pushPath : String -> Cmd msg


port swap : (Bool -> msg) -> Sub msg
