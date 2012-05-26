local IDEONE_LANGUAGES = {
    [ "ada" ] = "7",
    [ "assembler" ] = "13",
    [ "awk" ] = "104",
    [ "bash" ] = "28",
    [ "bc" ] = "110",
    [ "brainfuck" ] = "12",
    [ "c" ] = "11",
    [ "c#" ] = "27",
    [ "c++" ] = "1",
    [ "c++0x" ] = "44",
    [ "c99" ] = "34",
    [ "clips" ] = "14",
    [ "clisp" ] = "32",
    [ "clojure" ] = "111",
    [ "cobol" ] = "118",
    [ "cobol85" ] = "106",
    [ "d" ] = "102",
    [ "erlang" ] = "36",
    [ "f#" ] = "124",
    [ "factor" ] = "123",
    [ "falcon" ] = "125",
    [ "forth" ] = "107",
    [ "fortran" ] = "5",
    [ "go" ] = "114",
    [ "groovy" ] = "121",
    [ "haskell" ] = "21",
    [ "icon" ] = "16",
    [ "intercal" ] = "9",
    [ "java" ] = "10",
    [ "java7" ] = "55",
    [ "js-rhino" ] = "35",
    [ "js-spidermonkey" ] = "112",
    [ "lua" ] = "26",
    [ "nemerle" ] = "30",
    [ "nice" ] = "25",
    [ "nimrod" ] = "122",
    [ "objective-c" ] = "43",
    [ "ocaml" ] = "8",
    [ "oz" ] = "119",
    [ "pascal-fpc" ] = "22",
    [ "pascal-gpc" ] = "2",
    [ "perl" ] = "3",
    [ "perl6" ] = "54",
    [ "php" ] = "29",
    [ "pike" ] = "19",
    [ "prolog-gnu" ] = "108",
    [ "prolog-swi" ] = "15",
    [ "python" ] = "4",
    [ "python3" ] = "116",
    [ "r" ] = "117",
    [ "ruby" ] = "17",
    [ "scala" ] = "39",
    [ "scheme" ] = "33",
    [ "smalltalk" ] = "23",
    [ "sql" ] = "40",
    [ "tcl" ] = "38",
    [ "text" ] = "62",
    [ "unlambda" ] = "115",
    [ "vb.net" ] = "101",
    [ "whitespace" ] = "6"
}

local function IDEONE_MATCHER(response, header)
    local url = header.location
    if url then
        return "http://ideone.com" .. url
    end
    return LP.error_retrieving_url
end

local function IDEONE_BODY()
    local run = LP.run and '1' or '0'
    local private = LP.private and '0' or '1'
    return LP.create_form_body({
        lang   = LP.get_language(),
        run    = run,
        public = private,
        submit = 'submit',
        file   = LP.textdata
    })
end

LP.add_service('ideone', 'http://ideone.com/ideone/index/submit', IDEONE_LANGUAGES, IDEONE_BODY, LP.default_post_method, IDEONE_MATCHER)
