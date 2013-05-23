<?php

return array(
	'profile' => true,
	'fetch' => PDO::FETCH_CLASS,
	'default' => 'mysql',
	'connections' => array(
		'mysql' => array(
			'driver'   => 'mysql',
			'host'     => 'mysql5-16.perso',
			'database' => 'rsltt107353',
			'username' => 'rsltt107353',
			'password' => '51GAb4Vu',
			'charset'  => 'utf8',
			'prefix'   => '',
		)
	),
	'redis' => array(
		'default' => array(
			'host'     => '127.0.0.1',
			'port'     => 6379,
			'database' => 0
		)
	)
);