

module Facter::Util::MSWindows

def self.getWindowsRelease()
	caption = ""
	Win32_OperatingSystem.each { |x| caption = x["Caption"] }
    return caption
end

def self.Win32_OperatingSystem
	require 'win32ole'
    wmi = WIN32OLE.connect("winmgmts://")
    query = wmi.ExecQuery("select * from Win32_OperatingSystem")
	query
end

end