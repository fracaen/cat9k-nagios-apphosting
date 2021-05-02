# cat9k-nagios-apphosting

On the nagios server:
May need to add the following to the command definitions:
define command{
	command_name	check_ncpa
	command_line	$USER1$/check_ncpa.py -H $HOSTADDRESS$ -t $_HOSTTOKEN$ -P 5693 $ARG1$
	}

