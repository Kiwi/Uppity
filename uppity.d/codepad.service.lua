local CODEPAD_LANGUAGES = {
    "C", "C++", "D", "Haskell", "Lua", "OCaml", "PHP", "Perl", ["Plain"] = "Plain Text",
    "Python", "Ruby", "Scheme", "Tcl",
}

local function CODEPAD_MATCHER(response, header)
    local url = header.location
    if url then
        return url
    end
    return LP.error_retrieving_url
end

local function CODEPAD_BODY()
    local run = LP.run and 'True' or 'False'
    local private = LP.private and 'True' or 'False'
    return LP.create_form_body({
        client = 'Luapaste',
        run = run,
        lang = LP.get_language(),
        private = private,
        submit = 'Submit',
        code = LP.textdata
    })
end
LP.add_service('codepad', 'http://codepad.org/', CODEPAD_LANGUAGES, CODEPAD_BODY, LP.default_post_method, CODEPAD_MATCHER)

