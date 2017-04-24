import XMonad
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.DynamicLog
import XMonad.Util.EZConfig(additionalKeysP)
import XMonad.Layout.NoBorders(smartBorders)
import XMonad.Hooks.ManageHelpers
import XMonad.Actions.SpawnOn

startup :: X ()
startup = do
          spawn "urxvtd -q -f -o"
          spawnOn "2" "chromium-browser"

-- workspaces
mWorkspaces = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]

-- window manager
mWManager = composeAll . concat $
            [ [manageHook defaultConfig]
            , [manageDocks]
            , [manageSpawn]
            , [
                  -- windows that should be sent to a workspace
                  isFullscreen --> doFullFloat
                , className =? "Chromium" --> doShift "2"
              ]
            ]

myConfig = defaultConfig
	{ manageHook = mWManager
	, layoutHook = smartBorders (avoidStruts  $  layoutHook defaultConfig)
	, terminal = "urxvt"
  , workspaces = mWorkspaces
  , startupHook = startup
  , normalBorderColor = "#002b36"
  , focusedBorderColor = "#ffffff"
	} `additionalKeysP`
	[ 
    ("<XF86Tools>", spawn "$HOME/repos/c100p-tweaks/c100p.status.sh")
  , ("M-<F6>", spawn "$HOME/repos/c100p-tweaks/c100p.bl-adjust.sh down")
  , ("M-<F7>", spawn "$HOME/repos/c100p-tweaks/c100p.bl-adjust.sh up")
  , ("M-<F8>", spawn "$HOME/repos/c100p-tweaks/c100p.vol-adjust.sh toggle")
  , ("M-<F9>", spawn "$HOME/repos/c100p-tweaks/c100p.vol-adjust.sh down")
  , ("M-<F10>", spawn "$HOME/repos/c100p-tweaks/c100p.vol-adjust.sh up")
	, ("M-C-S-l", spawn "xautolock -locknow || (killall xautolock; xautolock -time 10 -locker slock & sleep 1; xautolock -locknow)")
	]

-- Command to launch the bar.
myBar = "xmobar"

-- Custom PP, configure it as you like. It determines what is being written to the bar.
myPP = xmobarPP { ppCurrent = xmobarColor "#ABABAB" "" . wrap "<" ">" . shorten 68}

-- Key binding to toggle the gap for the bar.
toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)

-- The main function.
main = xmonad =<< statusBar myBar myPP toggleStrutsKey myConfig
