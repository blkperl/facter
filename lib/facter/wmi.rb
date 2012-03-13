# Fact: win32_operatingsystem facts
#
# Purpose:
#   Returns the wmi properties in the win32OperatingSystem class
#
# Resolution:
#   Uses WMI to query for each property in win32OperatingSystem
#
# Caveats:
#
require 'facter/util/mswindows'

Facter::Util::MSWindows::get_win32OperatingSystem.each do |wmi_property|
  Facter.add(("wmi_win32_operatingsystem" +"_" + wmi_property.Name).to_sym) do
    confine :operatingsystem => :windows
    setcode do
      wmi_property.Value
    end
  end
end
