module Facter::Util::MSWindows

  def self.getWindowsRelease
    require 'win32ole'
    # WMI returns an IEnumVariant object
    wmi = WIN32OLE.connect("winmgmts://").ExecQuery("select Caption from Win32_OperatingSystem")
    result = nil
    wmi.each { |x| result = x["Caption"] }
    result
  end

end
