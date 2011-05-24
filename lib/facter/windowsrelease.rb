# Fact: windowsrelease
#
# Purpose:
#   Returns the windowsrelease of the system.
#
# Resolution:
#   Uses WMI to query for the OS caption string
#
# Caveats:
# 
require 'facter/util/mswindows'

Facter.add(:windowsrelease) do
    confine :operatingsystem => :windows
    setcode do
      Facter::Util::MSWindows.getWindowsRelease
    end
end


