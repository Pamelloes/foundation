-- |
-- Module      :  Language.ObjC.Foundation.NSObject
-- Copyright   :  (c) Joshua Brot 2015
-- License     :  MIT
-- Maintainer  :  joshuabrot@gmail.com

{-# LANGUAGE TemplateHaskell, QuasiQuotes, DeriveDataTypeable #-}

module Language.ObjC.Foundation.NSObject (
    NSObject,
    version
  ) where

import Data.Typeable

import Language.C.Quote.ObjC
import Language.C.Inline.ObjC
import Language.Haskell.TH

objc_import ["<Foundation/Foundation.h>"]

newtype NSZone = NSZone (ForeignPtr NSZone)

class NSCopying a where
  copyWithZone :: NSZone -> IO a

newtype NSObject a = NSObject (ForeignPtr (NSObject a))
objc_typecheck

version :: IO Int
version = $(objc [] $ ''Int <: [cexp| [NSObject version] |])

objc_emit


