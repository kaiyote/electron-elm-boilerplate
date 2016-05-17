module Tests exposing (..)

import ElmTest exposing (..)
import RoutesTests


all : Test
all =
    suite "Counter Test Suite"
        [
            RoutesTests.tests
        ]
