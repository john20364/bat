<?php
	require_once('file://c:/xampp/htdocs/esb/php/PHPLogUtils.php');
	$action = $argv[1];
	$stream = $argv[2];

	switch ($action) {
	case "start":
		// Close previous opened stream
		shell_exec("rtlsstop $stream");

		// Open RTLS stream $stream
		pclose(popen("start \"LAUNCHCOMMAND\" /MIN c:\\users\\078640\\dev\\bat\\rtlsstart $stream","r"));	

		// Close Launch command window
		shell_exec("launchcmdstop \"LAUNCHCOMMAND\"");
		$output = "Stream $stream is started.";
		PHPLog($output);
		break;
	case "stop":
		$output = shell_exec("rtlsstop $stream");
		PHPLog($output);
		break;
	case "state":
		$output = shell_exec("rtlsstate $stream");
		PHPLog($output);
		break;
	}
?>
