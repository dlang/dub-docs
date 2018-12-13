/**
	Copyright: © 2013 rejectedsoftware e.K.
	License: Subject to the terms of the GNU GPLv3 license, as written in the included LICENSE.txt file.
	Authors: Sönke Ludwig
*/
module dubregistry.web;

import dubregistry.viewutils; // dummy import to make rdmd happy

import dub.semver;
import std.algorithm : sort, startsWith, splitter;
import std.array;
import std.file;
import std.path;
import std.string;
import vibe.http.router;
import vibe.http.fileserver;
import vibe.web.web;


auto registerDubRegistryWebFrontend(URLRouter router)
{
	auto webfrontend = new DubRegistryFullWebFrontend();
	router.registerWebInterface(webfrontend);
	router.get("*", serveStaticFiles("./public"));
	return webfrontend;
}


class DubRegistryFullWebFrontend {

	@path("/")
	void getHome() { getGettingStarted(); }
	void getGettingStarted() { render!("getting_started.dt"); }

	void getAbout() { getGettingStarted(); }
	void getUsage() { getGettingStarted(); }

	void getAdvancedUsage() { render!("advanced_usage.dt"); }

	void getPublish() { render!("publish.dt"); }
	void getDevelop() { render!("develop.dt"); }


	@path("/package-format-json")
	void getPackageFormatJson()
	{
		render!("package_format_json.dt");
	}

	@path("/package-format-sdl")
	void getPackageFormatSdl()
	{
		render!("package_format_sdl.dt");
	}

	@path("/commandline")
	void getCommandLineDocs()
	{
		import dub.commandline;
		auto commands = getCommands();
		render!("docs.commandline.dt", commands);
	}

	@path("/settings")
	void getSettings()
	{
		render!("settings.dt");
	}
}
