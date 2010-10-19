/**
 * Generate the tcod.functions module from a flat list of functions,
 * given on stdin. Output to stdout.
 *
 * This is not particularly general purpose; it makes a lot of
 * assumptions about the function list that it will be given.
 */
module genfunctionsmod;

import std.stdio;
import std.ctype;
import std.string;


void main()
{
    stdout.writeln("/// This module has been automatically generated.");
    stdout.writeln("module tcod.c.functions;\n");

    stdout.writeln("version (Tango) {\n    import tango.sys.SharedLib;");
    stdout.writeln("    import tango.stdc.stringz;");
    stdout.writeln("} else import std.loader;\n");

    stdout.writeln("import tcod.c.all;");
    stdout.writeln("import tcod.c.types;\n");

    stdout.writeln("version (D_Version2) {");
    stdout.writeln(`    string gshared() { return "__gshared "; }`);
    stdout.writeln("} else {");
    stdout.writeln(`    string gshared() { return " "; }`);
    stdout.writeln("}\n");

    stdout.writeln("version (Tango) alias SharedLib SharedObject;");
    stdout.writeln("else alias HXModule SharedObject;\n");

    stdout.writeln("extern (C):\n");

    string[] functions;
    foreach (line; stdin.byLine) {
        if (line.emptyOrWhitespace()) continue;
        functions ~= line.idup;
    }

    // Okay, first declare the function variables.
    foreach (functionLine; functions) {
        stdout.writeln(`mixin(gshared() ~ "`, functionLine, `");`);
    }
    stdout.writeln();

    stdout.writeln("extern (D):\n");

    stdout.writeln(`mixin("private " ~ gshared() ~ "SharedObject gTCODhandle;");`);
    stdout.writeln();
    stdout.writeln("private void* getSymbol(string name)");
    stdout.writeln("{");
    stdout.writeln("    version (Tango) return gTCODhandle.getSymbol(toStringz(name));");
    stdout.writeln("    else return ExeModule_GetSymbol(gTCODhandle, name);");
    stdout.writeln("}");

    stdout.writeln("static ~this()\n{");
    stdout.writeln("    version (Tango) gTCODhandle.unload();");
    stdout.writeln("    else ExeModule_Uninit();");
    stdout.writeln("}\n");

    stdout.writeln("static this()\n{");
    stdout.writeln("    version (Tango) {");
    stdout.writeln("    } else {");
    stdout.writeln("        if (ExeModule_Init() < 0) {");
    stdout.writeln(`            throw new Exception("std.loader.ExeModule_Init has failed to initialise.");`);
    stdout.writeln("        }");
    stdout.writeln("    }\n");

    stdout.writeln("    version (Posix) {");
    stdout.writeln(`        version (Tango) gTCODhandle = SharedLib.load("./libtcod_debug.so");`);
    stdout.writeln(`        else gTCODhandle = ExeModule_Load("./libtcod_debug.so");`);
    stdout.writeln(`        if (!gTCODhandle) {`);
    stdout.writeln(`            version (Tango) gTCODhandle = SharedLib.load("./libtcod.so");`);
    stdout.writeln(`            else gTCODhandle = ExeModule_Load("./libtcod.so");`);
    stdout.writeln(`        }`);
    stdout.writeln("    } else {");
    stdout.writeln(`        version (Tango) gTCODhandle = SharedLib.load("libtcod_debug.dll");`);
    stdout.writeln(`        else gTCODhandle = ExeModule_Load("libtcod_debug.dll");`);
    stdout.writeln(`        if (!gTCODhandle) {`);
    stdout.writeln(`            version (Tango) gTCODhandle = SharedLib.load("libtcod.dll");`);
    stdout.writeln(`            else gTCODhandle = ExeModule_Load("libtcod.dll");`);
    stdout.writeln(`        }`);
    stdout.writeln("    }");
    stdout.writeln("    assert(gTCODhandle);\n");

    // Now load the functions from the shared object, asserting each time.
    foreach (functionLine; functions) {
        string[] functionParts = split(functionLine, " ");
        string functionName = "";

        foreach (functionPart; functionParts) {
            if (functionPart.length >= 4 && functionPart[0 .. 4] == "TCOD" && functionPart[$ - 1] == ';') {
                functionName = functionPart[0 .. $ - 1];  // Remove trailing semicolon.
                break;
            }
        }
        if (functionName.length == 0) throw new Exception("Malformed function line.");

        stdout.writeln("    ", functionName, " = cast(typeof(", functionName, ")) getSymbol(\"", functionName, "\");");
        stdout.writeln("    assert(", functionName, ");");
    }

    stdout.writeln("}\n");
}

/**
 * Returns: true if string `s` is comprised entirely of whitespace
 *          or is completely empty.
 */
bool emptyOrWhitespace(T)(T s)
{
    bool emptyOrWhite = true;
    foreach (c; s) {
        if (!isspace(c)) {
            emptyOrWhite = false;
            break;
        }
    }

    return emptyOrWhite;
}

unittest
{
    assert(emptyOrWhitespace(""));
    assert(emptyOrWhitespace("   \t\n   \t \n"));
    assert(!emptyOrWhitespace("  a "));
}

