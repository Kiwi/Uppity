local SPRUNGE_LANGUAGES = {['plain'] = true, ['plain text'] = true, 'js+mako',
    'javascript+mako', 'brainfuck', 'bf', 'html+cheetah', 'html+spitfire', 'bash',
    'sh', 'ksh', 'css+myghty', 'cfm', 'smarty', 'protobuf', 'apacheconf', 'aconf',
    'apache', 'java', 'js+genshitext', 'js+genshi', 'javascript+genshitext',
    'javascript+genshi', 'erlang', 'coffee-script', 'coffeescript', 'antlr-as',
    'antlr-actionscript', 'd-objdump', 'css+erb', 'css+ruby', 'mysql', 'cpp',
    'c++', 'xml+smarty', 'ahk', 'felix', 'flx', 'cmake', 'mako', 'python', 'py',
    'js+myghty', 'javascript+myghty', 'xml+mako', 'scaml', 'SCAML', 'maql', 'boo',
    'as', 'actionscript', 'vb.net', 'vbnet', 'squidconf', 'squid.conf', 'squid',
    'd', 'logtalk', 'scss', 'bbcode', 'haml', 'HAML', 'mupad', 'xml+erb',
    'xml+ruby', 'control', 'jade', 'JADE', 'rhtml', 'html+erb', 'html+ruby',
    'xml+velocity', 'js+cheetah', 'javascript+cheetah', 'js+spitfire',
    'javascript+spitfire', 'pytb', 'cfs', 'ada', 'ada95ada2005', 'objdump',
    'css+mako', 'Cucumber', 'cucumber', 'Gherkin', 'gherkin', 'ragel-java', 'io',
    'vala', 'vapi', 'haskell', 'hs', 'lua', 'sass', 'SASS', 'antlr-objc', 'xml',
    'groff', 'nroff', 'man', 'glsl', 'genshitext', 'objective-j', 'objectivej',
    'obj-j', 'objj', 'gas', 'pycon', 'mxml', 'xml+cheetah', 'xml+spitfire', 'go',
    'ragel-c', 'aspx-cs', 'properties', 'ragel-ruby', 'ragel-rb', 'blitzmax',
    'bmax', 'html+genshi', 'html+kid', 'perl', 'pl', 'ini', 'cfg', 'c-objdump',
    'tcsh', 'csh', 'rconsole', 'rout', 'css+smarty', 'text', 'antlr-csharp',
    'antlr-c#', 'dpatch', 'llvm', 'nginx', 'applescript', 'html+smarty', 'lhs',
    'literate-haskell', 'php', 'php3', 'php4', 'php5', 'minid', 'ooc', 'sql',
    'nasm', 'sourceslist', 'sources.list', 'delphi', 'pas', 'pascal',
    'objectpascal', 'aspx-vb', 'html+evoque', 'numpy', 'modula2', 'm2',
    'html+django', 'html+jinja', 'css+php', 'vim', 'css+genshitext', 'css+genshi',
    'ragel', 'ssp', 'xml+evoque', 'hx', 'haXe', 'redcode', 'django', 'jinja',
    'scala', 'lighty', 'lighttpd', 'html+velocity', 'ragel-d', 'rbcon', 'irb',
    'css', 'js+smarty', 'javascript+smarty', 'asy', 'asymptote', 'xml+php',
    'fortran', 'gnuplot', 'rebol', 'erb', 'befunge', 'dylan', 'trac-wiki', 'moin',
    'matlab', 'octave', 'c', 'html', 'genshi', 'kid', 'xml+genshi', 'xml+kid',
    'rst', 'rest', 'restructuredtext', 'velocity', 'irc', 'prolog', 'css+django',
    'css+jinja', 'smalltalk', 'squeak', 'yaml', 'html+myghty', 'make', 'makefile',
    'mf', 'bsdmake', 'xslt', 'splus', 's', 'r', 'sqlite3', 'ocaml', 'pot', 'po',
    'rb', 'ruby', 'duby', 'py3tb', 'pov', 'ragel-cpp', 'evoque', 'jsp', 'abap',
    'html+mako', 'diff', 'udiff', 'matlabsession', 'mason', 'html+php',
    'postscript', 'v', 'antlr-java', 'tcl', 'js+erb', 'javascript+erb', 'js+ruby',
    'javascript+ruby', 'basemake', 'antlr-python', 'cpp-objdump', 'c++-objdumb',
    'cxx-objdump', 'ioke', 'ik', 'python3', 'py3', 'bat', 'antlr', 'js+django',
    'javascript+django', 'js+jinja', 'javascript+jinja', 'cython', 'pyx', 'scheme',
    'scm', 'erl', 'clojure', 'clj', 'modelica', 'antlr-perl', 'myghty', 'duel',
    'Duel Engine', 'Duel View', 'JBST', 'jbst', 'JsonML+BST', 'moocode',
    'newspeak', 'console', 'raw', 'csharp', 'c#', 'tex', 'latex', 'cheetah',
    'spitfire', 'gooddata-cl', 'objective-c', 'objectivec', 'obj-c', 'objc', 'js',
    'javascript', 'common-lisp', 'cl', 'ragel-em', 'as3', 'actionscript3',
    'antlr-cpp', 'hybris', 'hy', 'js+php', 'javascript+php', 'factor', 'xquery',
    'xqy', 'ragel-objc', 'xml+django', 'xml+jinja', 'antlr-ruby', 'antlr-rb',
    'xml+myghty',
}

local function SPRUNGE_MATCHER(response, header)
    local lang = LP.get_language()
    local url = response:match('(http://sprunge.us/.+[^\n])')
    if url then
        if lang ~= true then
            return string.format('%s?%s', url, lang)
        end
        return url
    end
    return LP.error_retrieving_url
end

local function SPRUNGE_BODY()
    return LP.create_form_body({
        sprunge = LP.textdata
    })
end

LP.add_service('sprunge', 'http://sprunge.us', SPRUNGE_LANGUAGES, SPRUNGE_BODY, LP.default_post_method, SPRUNGE_MATCHER)

