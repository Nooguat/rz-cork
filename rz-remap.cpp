// #include <rz_asm.h>
// #include <stdlib.h>
// #include <string.h>
// #include <vector>
// #include <rz_types.h>
// #include <rz_lib.h>
// #include <rz_cmd.h>
// #include <rz_core.h>
// #include <rz_cons.h>
// #include <rz_analysis.h>

#include <cstdio>
#include <iostream>
#include <librz/rz_cmd.h>
#include <vector>
#include <memory>
#include <stdexcept>
#include <string>
#include <array>
#include <algorithm>

#include <librz/rz_cons.h>
#include <librz/rz_core.h>
#include <rz_lib.h>
#include "rz-remap.h"

#undef RZ_API
#define RZ_API static
#undef RZ_IPI
#define RZ_IPI      
#define with(T, ...) ([]{ T ${}; __VA_ARGS__; return $; }())
static const RzCmdDescArg args_none[] = {{}};


std::string execCork(const char* cmd) {
    std::array<char, 128> buffer;
    std::string result;
    std::unique_ptr<FILE, decltype(&pclose)> pipe(popen(cmd, "r"), pclose);
    if (!pipe) {
        throw std::runtime_error("popen() failed!");
    }
    while (fgets(buffer.data(), buffer.size(), pipe.get()) != nullptr) {
        result += buffer.data();
    }
    return result;
}


static RzCmdDescDetailEntry root_details_env[] = {
	with(RzCmdDescDetailEntry,
		$.text = "TESTING";
		$.comment = "Path to nothing xd"
	),
	{}
};
static RzCmdDescDetail root_details[] = {
	with(RzCmdDescDetail,
		$.name = "Environment",
		$.entries = root_details_env
	),
	{}
};


static bool rz_remap_fini(RzCore *core){
	auto rzcmd = core->rcmd;
	RzCmdDesc *h_cmd = rz_cmd_get_desc(rzcmd, "h");
	rz_cmd_desc_remove(rzcmd, h_cmd);
	return true;
}
static RzCmdStatus h_handler(RzCore *core, int argc, const char** argv){
	// if(argc <= 2){
	// 	rz_cons_printf("Needs an argument to work");
	// 	return RZ_CMD_STATUS_OK;
	// }
	std::string argument;
	std::for_each( argv + 1, argv + argc , [&]( const char* c_str ){ argument += std::string ( c_str ) + " "; } );
	std::cout << argument; 
	argument.insert(0, "cork -e \"");
	argument.append("\"");
	std::string ret = execCork(argument.c_str());
	rz_cons_printf("%s", ret.c_str());
	// rz_cons_print("Test");
	// eprintf("test");
	return RZ_CMD_STATUS_OK;
}

static const RzCmdDescArg h_args[] = {
	with(RzCmdDescArg, 
		$.name = "N", 
		$.optional = false;
		$.no_space = false;
		$.type = RZ_CMD_ARG_TYPE_STRING;
	)
};
static const RzCmdDescHelp h_help = with(RzCmdDescHelp, 
	$.summary = "Calls the cork binary"; 
	$.args = h_args
	);


static const RzCmdDescHelp root_help = with(RzCmdDescHelp,
	$.summary = "User-controlled commands";
	$.args = args_none;
	$.details = root_details
);

static RzCmdStatus he_handler(RzCore *core, int argc, const char **argv) {
	printf("Testing something");
	return RZ_CMD_STATUS_OK;
}

static const RzCmdDescHelp he_help = with(RzCmdDescHelp,
	$.summary = "should print something";
	$.args = args_none
);

static bool rz_remap_init(RzCore *core){

	RzConfig *cfg = core->config;
	rz_config_lock (cfg, false);
	rz_config_lock (cfg, true);
	auto rzcmd = core->rcmd;
	RzCmdDesc *root_cd = rz_cmd_desc_group_new(rzcmd, rz_cmd_get_desc(rzcmd, "pd"), "h", h_handler, &h_help , &root_help);
	// rz_cmd_desc_argv_new(rzcmd, root_cd, "he", he_handler, &he_help);
	printf("Testing something....");
	return true;

}



RzCorePlugin rz_plugin_remap = {
	/* .name = */ "rz-remap",
	/* .desc = */ "Adding some missing keybinds",
	/* .license = */ "LGPL3",
	/* .author = */ "nooguat",
	/* .version = */ nullptr,
	/*.init = */ rz_remap_init,
	/*.fini = */ rz_remap_fini
};

#ifndef CORELIB
extern "C"{
RzLibStruct rizin_plugin = {
	/* .type = */ RZ_LIB_TYPE_CORE,
	/* .data = */ &rz_plugin_remap,
	/* .version = */ RZ_VERSION,
	/* .free = */ nullptr,
};
// RzLibStructFunc rizin_plugin_function = &rizin_plugin;
}
#endif
