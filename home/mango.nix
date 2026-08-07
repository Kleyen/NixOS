{
	inputs,
	lib,
	...
}: {
	imports = [ inputs.mangowm.hmModules.mango ];

	wayland.windowManager.mango = {
	enable = true;

	settings = {
		bind = [
			"SUPER,Return,spawn,ghostty"
			"SUPER,Q,killclient"
			"SUPER,R,reload_config"
			"SUPER+SHIFT,E,quit"
		];
	};

	autostart_sh = ''
	dms run &
	'';
	};
}
