local DPASTE_COM_LANGUAGES = {
    "Python", "PythonConsole", "Sql", "DjangoTemplate", "JScript", "Css", "Xml",
    "Diff", "Ruby", "Rhtml", "Haskell", "Apache", "Bash", ["Plain"] = "";
}

local function DPASTE_COM_MATCHER(response, header)
    local url = header.location
    if url then
        return url
    end
    return LP.error_retrieving_url
end

local function DPASTE_COM_BODY()
    return LP.create_form_body({
        client = 'Luapaste',
        content = LP.textdata,
        title = LP.description,
        poster = LP.nick,
        language = LP.get_language(),
    })
end

LP.add_service('dpaste.com', 'http://dpaste.com/api/v1/', DPASTE_COM_LANGUAGES, DPASTE_COM_BODY, LP.default_post_method, DPASTE_COM_MATCHER)

