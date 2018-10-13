Config {
       font = "xft:Ubuntu:style:Regular:size=10:antialias=true ,FontAwesome 5 Brands:size=10"
       , additionalFonts  = [ "xft:FontAwesome:size=10" ]
       , allDesktops      = True
       , bgColor          = "#000000" --"#282c34"
       , fgColor          = "#bbc2cf"
       , position         = TopW R 95
       , alpha            = 100
       , overrideRedirect = False
       , commands = [ Run Cpu [ "--template", "<fc=#cb4b16><fn=1></fn></fc> <total>%"
                              , "--Low","3"
                              , "--High","50"
                              , "--low","#bbc2cf"
                              , "--normal","#bbc2cf"
                              , "--high","#fb4934"] 50

                    , Run Kbd [ ("us","<fc=#cb4b16><fn=1></fn></fc> EN"),
                                ("de","<fc=#cb4b16><fn=1></fn></fc> DE"),
                                ("ara","<fc=#cb4b16><fn=1></fn></fc> AR")]
                    , Run Memory ["-t","<fc=#cb4b16><fn=1></fn></fc> <usedratio>%"
                                 ,"-H","80"
                                 ,"-L","10"
                                 ,"-l","#bbc2cf"
                                 ,"-n","#bbc2cf"
                                 ,"-h","#fb4934"] 50

                    , Run Date "<fc=#cb4b16><fn=1></fn></fc> %a %b %_d %I:%M" "date" 300
--                   , Run DynNetwork ["-t","<fc=#4db5bd><fn=1></fn></fc> <rx>, <fc=#c678dd><fn=1></fn></fc> <tx>"
--                                     ,"-H","200"
--                                     ,"-L","10"
--                                     ,"-h","#bbc2cf"
--                                     ,"-l","#bbc2cf"
--                                     ,"-n","#bbc2cf"] 50

                    , Run CoreTemp ["-t", "<fc=#cb4b16><fn=1></fn></fc> <core0>°"
                                   , "-L", "30"
                                   , "-H", "75"
                                   , "-l", "lightblue"
                                   , "-n", "#bbc2cf"
                                   , "-h", "#aa4450"] 50

                   , Run MPD       ["-t",
                                    "<statei> <artist> - <title> (<album>)",
                                  "--", "-P", "<fc=#cb4b16><fn=1></fn></fc>", "-Z", "<fc=#cb4b16><fn=1></fn></fc>", "-S", "<fc=#cb4b16><fn=1></fn></fc>"] 10

                   -- battery monitor
                    , Run BatteryP       [ "BAT0" ]
                                         [ "--template" , "<fc=#cb4b16><fn=1></fn></fc> <acstatus>"
                                         , "--Low"      , "10"        -- units: %
                                         , "--High"     , "80"        -- units: %
                                         , "--low"      , "#fb4934" -- #ff5555
                                         , "--normal"   , "#bbc2cf"
                                         , "--high"     , "#98be65"

                                         , "--" -- battery specific options
                                                   -- discharging status
                                                   , "-o"   , "<left>% (<timeleft>)"
                                                   -- AC "on" status
                                                   , "-O"   , "<left>% (<fc=#98be65>Charging</fc>)" -- 50fa7b
                                                   -- charged status
                                                   , "-i"   , "<fc=#cb4b16>Charged</fc>"
                                         ] 50
                    , Run StdinReader
                    ]
       , sepChar = "%"
       , alignSep = "}{"
       , template = "%StdinReader% }{ %mpd% | %cpu% | %coretemp% | %memory% | %battery% | %date% | %kbd% "   -- #69DFFA
       }
