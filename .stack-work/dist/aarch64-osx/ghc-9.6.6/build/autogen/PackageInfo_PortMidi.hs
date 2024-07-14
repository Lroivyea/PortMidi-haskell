{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -w #-}
module PackageInfo_PortMidi (
    name,
    version,
    synopsis,
    copyright,
    homepage,
  ) where

import Data.Version (Version(..))
import Prelude

name :: String
name = "PortMidi"
version :: Version
version = Version [0,2,0,0] []

synopsis :: String
synopsis = "A binding for PortMedia/PortMidi"
copyright :: String
copyright = ""
homepage :: String
homepage = "http://github.com/PortMidi/PortMidi"
