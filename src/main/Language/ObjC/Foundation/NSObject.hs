-- |
-- Module      :  Language.ObjC.Foundation.NSObject
-- Copyright   :  (c) Joshua Brot 2015
-- License     :  MIT
-- Maintainer  :  joshuabrot@gmail.com

{-# LANGUAGE TemplateHaskell, QuasiQuotes #-}

module Language.ObjC.Foundation.NSObject (
    NSObject,
    impl_nsobject
  ) where

import Language.C.Quote.ObjC
import Language.C.Inline.ObjC
import Language.Haskell.TH

objc_import ["HsFFI.h"
            ,"<Foundation/Foundation.h>"
            ]

class NSObject a where
  retain :: a -> IO ()
  release :: a -> IO ()
  autorelease :: a -> IO ()

impl_nsobject :: Name -> Q [Dec]
impl_nsobject c = [d| instance NSObject $(return$ConT c) where
                        retain a = $(objc ['a :> c] $ void [cexp| [((id)a) retain] |])
                        release a = $(objc ['a :> c] $ void [cexp| [((id)a) release] |])
                        autorelease a = $(objc ['a :> c] $ void [cexp| [((id)a) autorelease] |])
                  |]

objc_emit


