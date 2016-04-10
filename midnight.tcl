####################################################################################
#  A simple script to Announce when it is Midnight; made for the bot called fr3Sh
#
#  You can also check the time now by typing:
#    !now
#
#  (C) 2016 ArNz|8o8 - Using Creative Commens
#  Made for eggdrop 1.6.x and up (Tested on 1.6.21/TCL8.5)
#
#  Version 1.1 - Stable release, working as intented
#
#  Version 1.0 - First working release, code cleaned up
#
####################################################################################



# Set the vars for how time and date is displyed
set midnight_date(format) "%B %d, %Y"
set midnight_day(format) "%A"
set midnight_clock(format) "%H:%M"
set pub_clock(format) "%H:%M"

# The channel(s) to announce to (separate with space)
set time_announce "#Holland"

# The binds
bind time - "00 00 * * *" time:proc
bind pub -|- !time do_on_pub

# The Midnight proc

proc time:proc {min hour day month year} {
      set time_now [clock seconds]
      global midnight_day midnight_date midnight_clock
      puthelp "PRIVMSG $::time_announce :It's midnight! A fr3Sh new day is upon us.."
      puthelp "PRIVMSG $::time_announce :Today is [clock format [clock seconds] -timezone :Europe/Amsterdam -format $midnight_day(format)]. The date is [clock format [clock seconds] -timezone :Europe/Amsterdam -format $midnight_date(format)]."
      puthelp "PRIVMSG $::time_announce :Have a good one!"
   }

# The public proc

proc do_on_pub {args} {
      global midnight_day midnight_date pub_clock
      puthelp "PRIVMSG $::time_announce :It's [clock format [clock seconds] -timezone :Europe/Amsterdam -format $pub_clock(format)] (CET). Today is [clock format [clock seconds] -timezone :Europe/Amsterdam -format $midnight_day(format)], [clock format [clock seconds] -timezone :Europe/Amsterdam -format $midnight_date(format)]."
   }

# The End

putlog "Midnight Announcer 1.1 by ArNz|8o8 is loaded."
