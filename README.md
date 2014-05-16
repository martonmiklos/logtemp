logtemp
=======

This is an OpenWRT package which handles the following:
 - Initialize the I2C RTC 
 - Loads the TMP102 kernel module
 - Continously grabs the temperature data through sysfs and logs it to the /root/temp_log.csv every minute
 - Serve the /root folder contents with the busybox's builtin httpd (this could be used to download the csv file)
 
I have used it on an NSLU2 with a TMP112 SMBUS sensor. 
