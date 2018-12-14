###############################################################################
## OCSINVENTORY-NG
## Copyleft Guillaume PROTET 2013
## Web : http://www.ocsinventory-ng.org
##
## This code is open source and may be copied and modified as long as the source
## code is always made freely available.
## Please refer to the General Public Licence http://www.gnu.org/ or Licence.txt
################################################################################
 
package Apache::Ocsinventory::Plugins::ImagingDevices::Map;
 
use strict;
 
use Apache::Ocsinventory::Map;
#Plugin IMAGING DEVICES
$DATA_MAP{imagingdevices} = {
mask => 0,
multi => 1,
auto => 1,
delOnReplace => 1,
sortBy => 'NAME',
writeDiff => 0,
cache => 0,
fields => {
     NAME => {},
     MANUFACTURER => {},
     DESCRIPTION => {},
     SERIAL => {}
}
 
};
1;
