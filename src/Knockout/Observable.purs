module Knockout.Observable where
    
import Prelude  
import Control.Monad.Eff (Eff)
import Data.Foreign.Undefined (Undefined, unUndefined)
import Data.Maybe (Maybe)

foreign import data OBSERVABLE :: !

foreign import data OBSERVABLE_RD :: !

foreign import data Observable :: * -> *

{- TODO: I may not need the array type at all. It looks like ko.observableArray() returns the same type as
   ko.observable() does
-}

foreign import data ObservableArray :: * -> *

foreign import data Computed :: * -> *

foreign import empty :: forall a eff. Eff (observable :: OBSERVABLE | eff) (Observable a)

foreign import singleton :: forall a eff. a -> Eff (observable :: OBSERVABLE | eff) (Observable a)

foreign import emptyArray :: forall a eff. Eff (observable :: OBSERVABLE | eff) (ObservableArray a)

foreign import fromArray :: forall a eff. Array a -> Eff (observable :: OBSERVABLE | eff) (ObservableArray a)

foreign import computed :: forall a eff. (Unit -> Eff (observableRd :: OBSERVABLE_RD | eff ) a) 
                                      -> Eff (observable :: OBSERVABLE | eff) (Computed a)

foreign import readUndef :: forall a eff. Observable a 
                                       -> Eff (observableRd :: OBSERVABLE_RD | eff) (Undefined a)

read :: forall a eff. Observable a -> Eff (observableRd :: OBSERVABLE_RD | eff) (Maybe a)
read o = do
    v <- readUndef o
    pure $ unUndefined v

foreign import readArray :: forall a eff. ObservableArray a 
                                       -> Eff (observableRd :: OBSERVABLE_RD | eff) (Array a)

foreign import write :: forall a eff. Observable a -> a -> Eff (observable :: OBSERVABLE | eff) Unit

foreign import writeArray :: forall a eff. ObservableArray a -> Array a 
                                        -> Eff (observable :: OBSERVABLE | eff) Unit

modify :: forall a eff. (Maybe a -> a) -> Observable a 
                     -> Eff (observableRd :: OBSERVABLE_RD, observable :: OBSERVABLE | eff) Unit 
modify f o = do
    v <- read o
    write o $ f v
