module Knockout.Observable where

foreign import data OBSERVABLE :: !

foreign import data Observable :: * -> *

foreign import data ObservableArray :: * -> *

foreign import data Computed :: * -> *

foreign import empty :: forall eff. Eff (observable :: OBSERVABLE | eff) (Observable a)

foreign import singleton :: forall a eff. a -> Eff (observable :: OBSERVABLE | eff) (Observable a)

foreign import emptyArray :: forall eff. Eff (observable :: OBSERVABLE | eff) (ObservableArray a)

foreign import fromArray :: forall a eff. Array a -> Eff (observable :: OBSERVABLE | eff) (ObservableArray a)

