{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
#if __GLASGOW_HASKELL__ >= 810
{-# OPTIONS_GHC -Wno-prepositive-qualified-module #-}
#endif
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -w #-}
module Paths_PortMidi (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where


import qualified Control.Exception as Exception
import qualified Data.List as List
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude


#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,2,0,0] []

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir `joinFileName` name)

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath




bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath
bindir     = "/Users/gargisupe/Desktop/hertz/metronome/.stack-work/install/x86_64-osx/fbf92f685f2f370e9f3c5315579128e17061cd06675af74ed6d1d6d90ae8010a/9.6.6/bin"
libdir     = "/Users/gargisupe/Desktop/hertz/metronome/.stack-work/install/x86_64-osx/fbf92f685f2f370e9f3c5315579128e17061cd06675af74ed6d1d6d90ae8010a/9.6.6/lib/x86_64-osx-ghc-9.6.6/PortMidi-0.2.0.0-DNDlje2wQ0CFcDW8xopyw2"
dynlibdir  = "/Users/gargisupe/Desktop/hertz/metronome/.stack-work/install/x86_64-osx/fbf92f685f2f370e9f3c5315579128e17061cd06675af74ed6d1d6d90ae8010a/9.6.6/lib/x86_64-osx-ghc-9.6.6"
datadir    = "/Users/gargisupe/Desktop/hertz/metronome/.stack-work/install/x86_64-osx/fbf92f685f2f370e9f3c5315579128e17061cd06675af74ed6d1d6d90ae8010a/9.6.6/share/x86_64-osx-ghc-9.6.6/PortMidi-0.2.0.0"
libexecdir = "/Users/gargisupe/Desktop/hertz/metronome/.stack-work/install/x86_64-osx/fbf92f685f2f370e9f3c5315579128e17061cd06675af74ed6d1d6d90ae8010a/9.6.6/libexec/x86_64-osx-ghc-9.6.6/PortMidi-0.2.0.0"
sysconfdir = "/Users/gargisupe/Desktop/hertz/metronome/.stack-work/install/x86_64-osx/fbf92f685f2f370e9f3c5315579128e17061cd06675af74ed6d1d6d90ae8010a/9.6.6/etc"

getBinDir     = catchIO (getEnv "PortMidi_bindir")     (\_ -> return bindir)
getLibDir     = catchIO (getEnv "PortMidi_libdir")     (\_ -> return libdir)
getDynLibDir  = catchIO (getEnv "PortMidi_dynlibdir")  (\_ -> return dynlibdir)
getDataDir    = catchIO (getEnv "PortMidi_datadir")    (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "PortMidi_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "PortMidi_sysconfdir") (\_ -> return sysconfdir)



joinFileName :: String -> String -> FilePath
joinFileName ""  fname = fname
joinFileName "." fname = fname
joinFileName dir ""    = dir
joinFileName dir fname
  | isPathSeparator (List.last dir) = dir ++ fname
  | otherwise                       = dir ++ pathSeparator : fname

pathSeparator :: Char
pathSeparator = '/'

isPathSeparator :: Char -> Bool
isPathSeparator c = c == '/'
