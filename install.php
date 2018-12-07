<?php
function plugin_version_imagingdevices()
{
return array('name' => 'imagingdevices',
'version' => '1.2',
'author'=> 'Peter Dolloff',
'license' => 'GPLv2',
'verMinOcs' => '2.2');
}

function plugin_init_imagingdevices()
{
$object = new plugins;
$object -> add_cd_entry("imagingdevices","other");

$object -> sql_query("CREATE TABLE IF NOT EXISTS `imagingdevices` (
 `ID` INT(11) NOT NULL AUTO_INCREMENT,
 `HARDWARE_ID` INT(11) NOT NULL,
 `NAME` VARCHAR(255) DEFAULT NULL,
 `MANUFACTURER` VARCHAR(255) DEFAULT NULL,
 `DESCRIPTION` VARCHAR(255) DEFAULT NULL,
 `SERIAL` VARCHAR(255) DEFAULT NULL,
 PRIMARY KEY  (`ID`,`HARDWARE_ID`)
 ) ENGINE=InnoDB ;");

}

function plugin_delete_imagingdevices()
{
$object = new plugins;
$object -> del_cd_entry("imagingdevices");

$object -> sql_query("DROP TABLE `imagingdevices`;");

}

?>
