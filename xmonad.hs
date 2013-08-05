import System.IO
import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Layout.Fullscreen
import XMonad.Layout.NoBorders
import XMonad.Layout.Spiral
import XMonad.Layout.Tabbed
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)

myTerminal    = "urxvtc"
myModMask     = mod4Mask
myBorderWidth = 1
myWorkspaces  = ["1:main","2:web","3:dev","4:gfx","5:media","6:othr","7","8","9"]

myManageHook = composeAll
  [ className =? "Uzbl" --> doShift "2:web"
  , className =? "MPlayer" --> doShift "5:media"
  ]

myLayout = avoidStruts (
  Tall 1 (3/100) (2/3) |||
  Mirror (Tall 1 (3/100) (2/3)) |||
  Full |||
  spiral (6/7))

myNormalBorderColor  = "#252525"
myFocusedBorderColor = "#B0C4DE"

main = xmonad =<< xmobar defaultConfig
    { terminal           = myTerminal
    , modMask            = myModMask
    , borderWidth        = myBorderWidth
    , workspaces         = myWorkspaces
    , normalBorderColor  = myNormalBorderColor
    , focusedBorderColor = myFocusedBorderColor
    , layoutHook         = smartBorders $ myLayout
    , manageHook         = myManageHook <+> manageHook defaultConfig
    }
