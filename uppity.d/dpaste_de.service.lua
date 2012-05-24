local DPASTE_DE_LANGUAGES = {
    'bash', 'c', 'css', 'diff', 'django', 'html', 'irc', 'js', 'php', 'pycon',
    'pytb', 'python', 'python3', 'rst', 'sql', 'text'
}

local function DPASTE_DE_MATCHER(response, header)
    local url = header.location
    if url then
        return url
    end
    return LP.error_retrieving_url
end

local function DPASTE_DE_BODY()
    return LP.create_form_body({
        content = LP.textdata,
        lexer = LP.get_language(),
        expire_options = LP.get_expires(),
        submit = 'Paste it',
        title = '',
    })
end

local DPASTE_DE_EXPIRES = {['1 hour'] = '3600', ['1 week'] = '604800', ['1 month'] = '2592000'}

LP.add_service('dpaste.de', 'http://dpaste.de/', DPASTE_DE_LANGUAGES, DPASTE_DE_BODY, LP.default_post_method, DPASTE_DE_MATCHER, DPASTE_DE_EXPIRES)
