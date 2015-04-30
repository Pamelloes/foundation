-- |
-- Module      :  Language.ObjC.Foundation
-- Copyright   :  (c) Joshua Brot 2015
-- License     :  MIT
-- Maintainer  :  joshuabrot@gmail.com

{-# LANGUAGE TemplateHaskell, QuasiQuotes, DeriveDataTypeable #-}

module Language.ObjC.Foundation (
  module Language.ObjC.Foundation.NSObject
  --  module Language.ObjC.Foundation.NSRange
  ) where

import Data.Typeable

import Language.ObjC.Foundation.NSObject
--import Language.ObjC.Foundation.NSRange

import Language.C.Quote.ObjC
import Language.C.Inline.ObjC
import Language.Haskell.TH

objc_import ["<Foundation/Foundation.h>"
            ,"HsFFI.h"
            ]

newtype NSObject' = NSObject' (ForeignPtr NSObject') deriving Typeable
objc_typecheck
impl_nsobject ''NSObject'

objc_emit
