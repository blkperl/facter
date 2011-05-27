module Facter::Util::MSWindows

  def self.get_win32OperatingSystem
    require 'win32ole'
    wmi = WIN32OLE.connect("winmgmts://").ExecQuery("select * from Win32_OperatingSystem")
    os_properties = []
    for win32_operatingsystem in wmi do
      for property in win32_operatingsystem.Properties_ do
        os_properties.insert(0, property)
      end
      break
    end
    os_properties
  end

end
