#!/usr/bin/env lua

local UBUNTU_LANGUAGES = {
    "text", "apacheconf", "as", "bash", "bat", "bbcode", "befunge", "boo",
    "c", "c-objdump", "common-lisp", "control", "cpp", "cpp-objdump", "csharp",
    "css", "css+django", "css+erb", "css+genshitext", "css+mako", "css+myghty",
    "css+php", "css+smarty", "d", "d-objdump", "delphi", "diff", "django", 
    "dylan", "erb", "erlang", "gas", "genshi", "genshitext", "groff", 
    "haskell", "html", "html+django", "html+genshi", "html+mako", 
    "html+myghty", "html+php", "html+smarty", "ini", "irc", "java", "js", 
    "js+django", "js+erb", "js+genshitext", "js+mako", "js+myghty", "js+php", 
    "js+smarty", "jsp", "lhs", "llvm", "lua", "make", "mako", "minid", 
    "moocode", "mupad", "myghty", "mysql", "objdump", "objective-c", "ocaml",
    "perl", "php", "pot", "pycon", "pytb", "python", "raw", "rb", "rbcon", 
    "redcode", "rhtml", "rst", "scheme", "smarty", "sourceslist", "sql", 
    "squidconf", "tex", "text", "trac-wiki", "vb.net", "vim", "xml", 
    "xml+django", "xml+erb", "xml+mako", "xml+myghty", "xml+php", "xml+smarty"
}

local function UBUNTU_MATCHER(response, header)
    local url = header.location
    if url then
        return url
    end
    return LP.error_retrieving_url
end

local function UBUNTU_BODY()
    local run = LP.run and 'True' or 'False'
    local private = LP.private and 'True' or 'False'
    return LP.create_form_body({
        poster  = LP.nick,
        syntax  = LP.get_language(),
        content = LP.textdata
    })
end
LP.add_service('ubuntu', 'http://paste.ubuntu.com/', UBUNTU_LANGUAGES, UBUNTU_BODY, LP.default_post_method, UBUNTU_MATCHER)
