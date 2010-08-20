# manufacturer.rb
# Facts related to hardware manufacturer
#
#

require 'facter/util/manufacturer'

if Facter.value(:kernel) == "OpenBSD"
    mfg_keys = {
        'hw.vendor'   => 'manufacturer',
        'hw.product'  => 'productname',
        'hw.serialno' => 'serialnumber'
    }

    Facter::Manufacturer.sysctl_find_system_info(mfg_keys)

elsif Facter.value(:kernel) == "windows"
  win32_keys = {
        'manufacturer' => ['Manufacturer', 'Bios'],
        'serialNumber' => ['Serialnumber', 'Bios'],
        'productname'  => ['Name', 'ComputerSystemProduct']
    }
  Facter::Manufacturer.win32_find_system_info(win32_keys)
else
    query = {
        '[Ss]ystem [Ii]nformation' => [
            { 'Manufacturer:'      => 'manufacturer' },
            { 'Product(?: Name)?:' => 'productname' },
            { 'Serial Number:'     => 'serialnumber' }
        ],
        '(Chassis Information|system enclosure or chassis)' => [
            { '(?:Chassis )?Type:' => 'type' }
        ]
    }

    Facter::Manufacturer.dmi_find_system_info(query)
end

