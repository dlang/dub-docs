/**
	Copyright: © 2013 rejectedsoftware e.K.
	License: Subject to the terms of the GNU GPLv3 license, as written in the included LICENSE.txt file.
	Authors: Sönke Ludwig
*/
module app;

import dubregistry.web;

import std.algorithm : sort;
import std.process : environment;
import std.file;
import std.path;
import vibe.core.args;
import vibe.core.core;
import vibe.core.log;
import vibe.http.router;
import vibe.http.server;


void main()
{
	bool noMonitoring;
	setLogFile("log.txt", LogLevel.diagnostic);

	// web front end
	auto router = new URLRouter;
	router.registerDubRegistryWebFrontend();

	// start the web server
	auto settings = new HTTPServerSettings;
	settings.hostName = "code.dlang.org";
	settings.bindAddresses = ["127.0.0.1"];
	settings.port = 8005;
	readOption("bind", &settings.bindAddresses[0], "Sets the address used for serving.");
	readOption("port|p", &settings.port, "Sets the port used for serving.");

	listenHTTP(settings, router);

	runApplication();
}
